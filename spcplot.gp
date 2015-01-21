#!/usr/bin/env gnuplot

set terminal png
set datafile separator ","
set key right top
set xlabel "IOPS"
set ylabel "Latency (ms)"
set yrange [0:35]
set xrange [0:10000]
set style data linesp
set arrow 1 from 0,30 to 10000,30 nohead linetype rgb "black"

set output "spc.png"
plot "spc.csv" using 2:3 title ""
