#!/bin/sh

bsu=50
echo "----- WARMUP -----"

sudo ./pblio -asu1=/dev/vdk,/dev/vdj,/dev/vdi \
	-asu2=/dev/vdh,/dev/vdg,/dev/vdf \
	-asu3=/dev/vde,/dev/vdd,/dev/vdc \
	-contexts=10 -runlen=28800 \
	-bsu=$bsu -data=pblio-bsu_${bsu}.data

while [ $bsu -le 300 ] ; do
	echo "----- BSU $bsu -----"
	sudo ./pblio -asu1=/dev/vdk,/dev/vdj,/dev/vdi \
		-asu2=/dev/vdh,/dev/vdg,/dev/vdf \
		-asu3=/dev/vde,/dev/vdd,/dev/vdc \
		-contexts=10 -runlen=600 \
		-bsu=$bsu -data=pblio-bsu_${bsu}.data
	bsu=$((bsu+5))
done
