

/*************************************************************************/
/*                                                                       */
/*  Copyright (c) 1994 Stanford University                               */
/*                                                                       */
/*  All rights reserved.                                                 */
/*                                                                       */
/*  Permission is given to use, copy, and modify this software for any   */
/*  non-commercial purpose as long as this copyright notice is not       */
/*  removed.  All other uses, including redistribution in whole or in    */
/*  part, are forbidden without prior written permission.                */
/*                                                                       */
/*  This software is provided with absolutely no warranty and no         */
/*  support.                                                             */
/*                                                                       */
/*************************************************************************/

/*************************************************************************/
/*                                                                       */
/*  SPLASH Ocean Code                                                    */
/*                                                                       */
/*  This application studies the role of eddy and boundary currents in   */
/*  influencing large-scale ocean movements.  This implementation uses   */
/*  dynamically allocated four-dimensional arrays for grid data storage. */
/*                                                                       */
/*  Command line options:                                                */
/*                                                                       */
/*     -nN : Simulate NxN ocean.  N must be (power of 2)+2.              */
/*     -pP : P = number of processors.  P must be power of 2.            */
/*     -eE : E = error tolerance for iterative relaxation.               */
/*     -rR : R = distance between grid points in meters.                 */
/*     -tT : T = timestep in seconds.                                    */
/*     -s  : Print timing statistics.                                    */
/*     -o  : Print out relaxation residual values.                       */
/*     -h  : Print out command line options.                             */
/*                                                                       */
/*  Default: OCEAN -n130 -p1 -e1e-7 -r20000.0 -t28800.0                  */
/*                                                                       */
/*  NOTE: This code works under both the FORK and SPROC models.          */
/*                                                                       */
/*************************************************************************/



#include <stdlib.h>
#include <semaphore.h>
#include <assert.h>
#if __STDC_VERSION__ >= 201112L
#include <stdatomic.h>
#endif
#include <stdint.h>

#include <pthread.h>
#include <sched.h>
#include <unistd.h>

#include <sys/time.h>

#define PAGE_SIZE 4096
#define __MAX_THREADS__ 256

pthread_t __tid__[__MAX_THREADS__];
unsigned __threads__=0;
pthread_mutex_t __intern__;
unsigned __count__; volatile int __sense__=1; __thread int __local_sense__=1;


#define DEFAULT_N      258
#define DEFAULT_P        1
#define DEFAULT_E        1e-7
#define DEFAULT_T    28800.0
#define DEFAULT_R    20000.0
#define UP               0
#define DOWN             1
#define LEFT             2
#define RIGHT            3
#define UPLEFT           4
#define UPRIGHT          5
#define DOWNLEFT         6
#define DOWNRIGHT        7
#define PAGE_SIZE     4096

#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>
#include "decs.h"

struct multi_struct *multi;
struct global_struct *global;
struct locks_struct *locks;
struct bars_struct *bars;

double ****psi;
double ****psim;
double ***psium;
double ***psilm;
double ***psib;
double ***ga;
double ***gb;
double ****work1;
double ***work2;
double ***work3;
double ****work4;
double ****work5;
double ***work6;
double ****work7;
double ****temparray;
double ***tauz;
double ***oldga;
double ***oldgb;
double *f;
double ****q_multi;
double ****rhs_multi;

long nprocs = DEFAULT_P;
double h1 = 1000.0;
double h3 = 4000.0;
double h = 5000.0;
double lf = -5.12e11;
double res = DEFAULT_R;
double dtau = DEFAULT_T;
double f0 = 8.3e-5;
double beta = 2.0e-11;
double gpr = 0.02;
long im = DEFAULT_N;
long jm;
double tolerance = DEFAULT_E;
double eig2;
double ysca;
long jmm1;
double pi;
double t0 = 0.5e-4 ;
double outday0 = 1.0;
double outday1 = 2.0;
double outday2 = 2.0;
double outday3 = 2.0;
double factjacob;
double factlap;
long numlev;
long *imx;
long *jmx;
double *lev_res;
double *lev_tol;
double maxwork = 10000.0;

struct Global_Private *gp;

double *i_int_coeff;
double *j_int_coeff;
long xprocs;
long yprocs;
long *xpts_per_proc;
long *ypts_per_proc;
long minlevel;
long do_stats = 0;
long do_output = 0;

int main(int argc, char *argv[])
{
   long i;
   long j;
   long k;
   long x_part;
   long y_part;
   long d_size;
   long itemp;
   long jtemp;
   double procsqrt;
   long temp = 0;
   double min_total;
   double max_total;
   double avg_total;
   double min_multi;
   double max_multi;
   double avg_multi;
   double min_frac;
   double max_frac;
   double avg_frac;
   long ch;
   extern char *optarg;
   unsigned long computeend;
   unsigned long start;

   {
  struct timeval FullTime;
  gettimeofday(&FullTime, NULL);
  (start) = (unsigned long)(FullTime.tv_usec + FullTime.tv_sec * 1000000);
}

   while ((ch = getopt(argc, argv, "n:p:e:r:t:soh")) != -1) {
     switch(ch) {
     case 'n': im = atoi(optarg);
               if (log_2(im-2) == -1) {
                 printerr("Grid must be ((power of 2)+2) in each dimension\n");
                 exit(-1);
               }
               break;
     case 'p': nprocs = atoi(optarg);
               if (nprocs < 1) {
                 printerr("P must be >= 1\n");
                 exit(-1);
               }
               if (log_2(nprocs) == -1) {
                 printerr("P must be a power of 2\n");
                 exit(-1);
               }
               break;
     case 'e': tolerance = atof(optarg); break;
     case 'r': res = atof(optarg); break;
     case 't': dtau = atof(optarg); break;
     case 's': do_stats = !do_stats; break;
     case 'o': do_output = !do_output; break;
     case 'h': printf("Usage: OCEAN <options>\n\n");
               printf("options:\n");
               printf("  -nN : Simulate NxN ocean.  N must be (power of 2)+2.\n");
               printf("  -pP : P = number of processors.  P must be power of 2.\n");
               printf("  -eE : E = error tolerance for iterative relaxation.\n");
               printf("  -rR : R = distance between grid points in meters.\n");
               printf("  -tT : T = timestep in seconds.\n");
               printf("  -s  : Print timing statistics.\n");
               printf("  -o  : Print out relaxation residual values.\n");
               printf("  -h  : Print out command line options.\n\n");
               printf("Default: OCEAN -n%1d -p%1d -e%1g -r%1g -t%1g\n",
                       DEFAULT_N,DEFAULT_P,DEFAULT_E,DEFAULT_R,DEFAULT_T);
               exit(0);
               break;
     }
   }

   {__tid__[__threads__++]=pthread_self();}

   jm = im;
   printf("\n");
   printf("Ocean simulation with W-cycle multigrid solver\n");
   printf("    Processors                         : %1ld\n",nprocs);
   printf("    Grid size                          : %1ld x %1ld\n",im,jm);
   printf("    Grid resolution (meters)           : %0.2f\n",res);
   printf("    Time between relaxations (seconds) : %0.0f\n",dtau);
   printf("    Error tolerance                    : %0.7g\n",tolerance);
   printf("\n");

   xprocs = 0;
   yprocs = 0;
   procsqrt = sqrt((double) nprocs);
   j = (long) procsqrt;
   while ((xprocs == 0) && (j > 0)) {
     k = nprocs / j;
     if (k * j == nprocs) {
       if (k > j) {
         xprocs = j;
         yprocs = k;
       } else {
         xprocs = k;
         yprocs = j;
       }
     }
     j--;
   }
   if (xprocs == 0) {
     printerr("Could not find factors for subblocking\n");
     exit(-1);
   }

   minlevel = 0;
   itemp = 1;
   jtemp = 1;
   numlev = 0;
   minlevel = 0;
   while (itemp < (im-2)) {
     itemp = itemp*2;
     jtemp = jtemp*2;
     if ((itemp/yprocs > 1) && (jtemp/xprocs > 1)) {
       numlev++;
     }
   }

   if (numlev == 0) {
     printerr("Must have at least 2 grid points per processor in each dimension\n");
     exit(-1);
   }

   imx = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
   jmx = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
   lev_res = (double *) ({ void* mem = malloc(numlev*sizeof(double)); assert(mem); mem; });;
   lev_tol = (double *) ({ void* mem = malloc(numlev*sizeof(double)); assert(mem); mem; });;
   i_int_coeff = (double *) ({ void* mem = malloc(numlev*sizeof(double)); assert(mem); mem; });;
   j_int_coeff = (double *) ({ void* mem = malloc(numlev*sizeof(double)); assert(mem); mem; });;
   xpts_per_proc = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
   ypts_per_proc = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;

   imx[numlev-1] = im;
   jmx[numlev-1] = jm;
   lev_res[numlev-1] = res;
   lev_tol[numlev-1] = tolerance;

   for (i=numlev-2;i>=0;i--) {
     imx[i] = ((imx[i+1] - 2) / 2) + 2;
     jmx[i] = ((jmx[i+1] - 2) / 2) + 2;
     lev_res[i] = lev_res[i+1] * 2;
   }

   for (i=0;i<numlev;i++) {
     xpts_per_proc[i] = (jmx[i]-2) / xprocs;
     ypts_per_proc[i] = (imx[i]-2) / yprocs;
   }
   for (i=numlev-1;i>=0;i--) {
     if ((xpts_per_proc[i] < 2) || (ypts_per_proc[i] < 2)) {
       minlevel = i+1;
       break;
     }
   }

   for (i=0;i<numlev;i++) {
     temp += imx[i];
   }
   temp = 0;
   j = 0;
   for (k=0;k<numlev;k++) {
     for (i=0;i<imx[k];i++) {
       j++;
       temp += jmx[k];
     }
   }

   d_size = nprocs*sizeof(double ***);
   psi = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   psim = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work1 = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work4 = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work5 = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work7 = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   temparray = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;

   d_size = 2*sizeof(double **);
   for (i=0;i<nprocs;i++) {
     psi[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psim[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work1[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work4[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work5[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work7[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     temparray[i] = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   }

   d_size = nprocs*sizeof(double **);
   psium = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   psilm = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   psib = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   ga = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   gb = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work2 = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work3 = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   work6 = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   tauz = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   oldga = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   oldgb = (double ***) ({ void* mem = malloc(d_size); assert(mem); mem; });;

   gp = (struct Global_Private *) ({ void* mem = malloc((nprocs+1)*sizeof(struct Global_Private)); assert(mem); mem; });;
   for (i=0;i<nprocs;i++) {
     gp[i].rel_num_x = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].rel_num_y = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].eist = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].ejst = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].oist = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].ojst = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].rlist = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].rljst = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].rlien = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].rljen = (long *) ({ void* mem = malloc(numlev*sizeof(long)); assert(mem); mem; });;
     gp[i].multi_time = 0;
     gp[i].total_time = 0;
   }

   subblock();

   x_part = (jm - 2)/xprocs + 2;
   y_part = (im - 2)/yprocs + 2;

   d_size = x_part*y_part*sizeof(double) + y_part*sizeof(double *);

   global = (struct global_struct *) ({ void* mem = malloc(sizeof(struct global_struct)); assert(mem); mem; });;
   for (i=0;i<nprocs;i++) {
     psi[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psi[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psim[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psim[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psium[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psilm[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     psib[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     ga[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     gb[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work1[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work1[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work2[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work3[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work4[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work4[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work5[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work5[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work6[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work7[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     work7[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     temparray[i][0] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     temparray[i][1] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     tauz[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     oldga[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
     oldgb[i] = (double **) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   }
   f = (double *) ({ void* mem = malloc(im*sizeof(double)); assert(mem); mem; });;

   multi = (struct multi_struct *) ({ void* mem = malloc(sizeof(struct multi_struct)); assert(mem); mem; });;

   d_size = numlev*sizeof(double **);
   if (numlev%2 == 1) {         /* To make sure that the actual data
                                   starts double word aligned, add an extra
                                   pointer */
     d_size += sizeof(double **);
   }
   for (i=0;i<numlev;i++) {
     d_size += ((imx[i]-2)/yprocs+2)*((jmx[i]-2)/xprocs+2)*sizeof(double)+
              ((imx[i]-2)/yprocs+2)*sizeof(double *);
   }

   d_size *= nprocs;

   if (nprocs%2 == 1) {         /* To make sure that the actual data
                                   starts double word aligned, add an extra
                                   pointer */
     d_size += sizeof(double ***);
   }

   d_size += nprocs*sizeof(double ***);
   q_multi = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;
   rhs_multi = (double ****) ({ void* mem = malloc(d_size); assert(mem); mem; });;

   locks = (struct locks_struct *) ({ void* mem = malloc(sizeof(struct locks_struct)); assert(mem); mem; });;
   bars = (struct bars_struct *) ({ void* mem = malloc(sizeof(struct bars_struct)); assert(mem); mem; });;

   {pthread_mutex_init(&(locks->idlock),NULL);}
   {pthread_mutex_init(&(locks->psiailock),NULL);}
   {pthread_mutex_init(&(locks->psibilock),NULL);}
   {pthread_mutex_init(&(locks->donelock),NULL);}
   {pthread_mutex_init(&(locks->error_lock),NULL);}
   {pthread_mutex_init(&(locks->bar_lock),NULL);}

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;

   __count__=nprocs;


   link_all();

   multi->err_multi = 0.0;
   i_int_coeff[0] = 0.0;
   j_int_coeff[0] = 0.0;
   for (i=0;i<numlev;i++) {
     i_int_coeff[i] = 1.0/(imx[i]-1);
     j_int_coeff[i] = 1.0/(jmx[i]-1);
   }

/* initialize constants and variables

   id is a global shared variable that has fetch-and-add operations
   performed on it by processes to obtain their pids.   */

   global->id = 0;
   global->psibi = 0.0;
   pi = atan(1.0);
   pi = 4.*pi;

   factjacob = -1./(12.*res*res);
   factlap = 1./(res*res);
   eig2 = -h*f0*f0/(h1*h3*gpr);

   jmm1 = jm-1 ;
   ysca = ((double) jmm1)*res ;

   im = (imx[numlev-1]-2)/yprocs + 2;
   jm = (jmx[numlev-1]-2)/xprocs + 2;

   if (do_output) {
     printf("                       MULTIGRID OUTPUTS\n");
   }

   ;
   {
	long	i, Error;

	assert(__threads__<__MAX_THREADS__);
	pthread_mutex_lock(&__intern__);
	for (i = 0; i < (nprocs) - 1; i++) {
		
  

		Error = pthread_create(&__tid__[__threads__++], NULL, (void * (*)(void *))(slave), NULL);
		if (Error != 0) {
			printf("Error in pthread_create().\n");
			exit(-1);
		}
	}
	pthread_mutex_unlock(&__intern__);
	
  


	slave();
};
   {int aantal=nprocs; while (aantal--) pthread_join(__tid__[aantal], NULL);};
   ;
   {
  struct timeval FullTime;
  gettimeofday(&FullTime, NULL);
  (computeend) = (unsigned long)(FullTime.tv_usec + FullTime.tv_sec * 1000000);
}

   printf("\n");
   printf("                       PROCESS STATISTICS\n");
   printf("                  Total          Multigrid         Multigrid\n");
   printf(" Proc             Time             Time            Fraction\n");
   printf("    0   %15.0f    %15.0f        %10.3f\n", gp[0].total_time,gp[0].multi_time, gp[0].multi_time/gp[0].total_time);

   if (do_stats) {
     min_total = max_total = avg_total = gp[0].total_time;
     min_multi = max_multi = avg_multi = gp[0].multi_time;
     min_frac = max_frac = avg_frac = gp[0].multi_time/gp[0].total_time;
     for (i=1;i<nprocs;i++) {
       if (gp[i].total_time > max_total) {
         max_total = gp[i].total_time;
       }
       if (gp[i].total_time < min_total) {
         min_total = gp[i].total_time;
       }
       if (gp[i].multi_time > max_multi) {
         max_multi = gp[i].multi_time;
       }
       if (gp[i].multi_time < min_multi) {
         min_multi = gp[i].multi_time;
       }
       if (gp[i].multi_time/gp[i].total_time > max_frac) {
         max_frac = gp[i].multi_time/gp[i].total_time;
       }
       if (gp[i].multi_time/gp[i].total_time < min_frac) {
         min_frac = gp[i].multi_time/gp[i].total_time;
       }
       avg_total += gp[i].total_time;
       avg_multi += gp[i].multi_time;
       avg_frac += gp[i].multi_time/gp[i].total_time;
     }
     avg_total = avg_total / nprocs;
     avg_multi = avg_multi / nprocs;
     avg_frac = avg_frac / nprocs;
     for (i=1;i<nprocs;i++) {
       printf("  %3ld   %15.0f    %15.0f        %10.3f\n", i,gp[i].total_time,gp[i].multi_time, gp[i].multi_time/gp[i].total_time);
     }
     printf("  Avg   %15.0f    %15.0f        %10.3f\n", avg_total,avg_multi,avg_frac);
     printf("  Min   %15.0f    %15.0f        %10.3f\n", min_total,min_multi,min_frac);
     printf("  Max   %15.0f    %15.0f        %10.3f\n", max_total,max_multi,max_frac);
   }
   printf("\n");

   global->starttime = start;
   printf("                       TIMING INFORMATION\n");
   printf("Start time                        : %16lu\n", global->starttime);
   printf("Initialization finish time        : %16lu\n", global->trackstart);
   printf("Overall finish time               : %16lu\n", computeend);
   printf("Total time with initialization    : %16lu\n", computeend-global->starttime);
   printf("Total time without initialization : %16lu\n", computeend-global->trackstart);
   printf("    (excludes first timestep)\n");
   printf("\n");

   {exit(0);}
}

long log_2(long number)
{
  long cumulative = 1;
  long out = 0;
  long done = 0;

  while ((cumulative < number) && (!done) && (out < 50)) {
    if (cumulative == number) {
      done = 1;
    } else {
      cumulative = cumulative * 2;
      out ++;
    }
  }

  if (cumulative == number) {
    return(out);
  } else {
    return(-1);
  }
}

void printerr(char *s)
{
  fprintf(stderr,"ERROR: %s\n",s);
}

