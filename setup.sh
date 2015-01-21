#!/bin/sh

bsu=50
root=`pwd`

mkdir data
while [ $bsu -lt 300 ] ; do
	mkdir data/$bsu
	cp pblio-bsu_${bsu}.data data/${bsu}/pblio.data
	cd data/${bsu}
	${root}/pblioplot_nc.gp

	echo "
# BSU ${bsu}

## Total

### IOPS

![total_iops](pblio_iops.png)

### Reads

* Total Read IOs

![total_read_ios](pblio_total_read_ios.png)

* Total Read Latnecy

![total_read_latency](pblio_total_read_latency.png)

### Writes

* Total Write IOs

![total_write_ios](pblio_total_write_ios.png)

* Total Write Latnecy

![total_write_latency](pblio_total_write_latency.png)

" > README.md

	cd $root
	bsu=$((bsu+5))
done