# Script File Framed by Sukarn Agarwal (Email: sagarwa2@ed.ac.uk)

#!/bin/bash


extra=""
if [ ! -z "$1" ]
then 
	extra="$1"
fi

for i in MP LB SB IRIW
do
	cd $i
	echo "Building " $i
	sudo docker run --rm -v ${PWD}:${PWD} -w ${PWD} -u $UID:$GID gcn-gpu2 make
	cd ..
done

