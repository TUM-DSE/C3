# Script File Framed by Sukarn Agarwal (sagarwa2@ed.ac.uk)
#!/bin/bash


extra=""
if [ ! -z "$1" ]
then 
	extra="$1"
fi

for i in MP LB SB IRIW
do
	cd $i
	for j in -sys -sys-F -cta-F
	do
		if [[ $j == "-cta-F" ]]; then
			if [[ $i != "MP" ]]; then
				continue
			fi
		fi
		k=$i
		k+=$j
		if [[ $k == "LB-sys-F" ]]; then
			continue
		fi
		cd $k
		echo "Building " $k 
		sudo docker run --rm -v ${PWD}:${PWD} -w ${PWD} -u $UID:$GID gcn-gpu2 make
		cd ..
	done
	cd ..
done

