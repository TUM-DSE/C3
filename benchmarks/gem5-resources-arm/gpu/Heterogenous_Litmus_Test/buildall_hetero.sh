# Scirpt File Framed by Sukarn Agarwal (sagarwa2@ed.ac.uk)
#!/bin/bash


extra=""
if [ ! -z "$1" ]
then 
	extra="$1"
fi

for i in MP LB SB IRIW
do
	cd $i
	if [[ $i == "MP" || $i == "IRIW" ]]; then 
		array=( 1 2 )
	else
		array=( 1 ) 
	fi
	for j in "${array[@]}" 
	do
		for k in -sys -sys-F 	
		do
			if [[ $i == "MP" || $i == "IRIW" ]]; then
				l=$i
				l+=$j
				l+=$k
				if [[ $l == "IRIW1-sys-F" ]]; then
					continue
				fi
				cd $l
				echo "Building " $l 
				sudo docker run --rm -v ${PWD}:${PWD} -w ${PWD} -u $UID:$GID gcn-gpu2 make
				cd ..
			else
				l=$i
				l+=$k
				if [[ $l == "LB-sys-F" ]]; then
					continue
				fi
				cd $l
				echo "Building " $l
				sudo docker run --rm -v ${PWD}:${PWD} -w ${PWD} -u $UID:$GID gcn-gpu2 make
				cd ..
			fi	
		done	
			
	done		
	cd ..		
done

cd MP/MP1-CTA-F
echo "Building MP1-cta-F"
sudo docker run --rm -v ${PWD}:${PWD} -w ${PWD} -u $UID:$GID gcn-gpu2 make
cd ../../


