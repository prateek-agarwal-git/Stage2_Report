#!/bin/bash
set autoscale #scales axes automatically
unset log #remove any log-scaling
unset label #remove any prev labels
set terminal postscript eps enhanced color font 'Arial,18'
#set terminal png font 'Arial,12'
set output 'dynScaling_SteerOffload.eps'
set xtics auto
set ytics auto
set y2tics auto
#set format y "10^{%L}"
#set format y2 "10^{%L}"
#set title "LTE-EPC: Application Throughput"
set xlabel  "Time (in secs)" 
set ylabel "Throughput (Mbps)"
set y2label "Latency ({/Symbol m}s)"
#set y2label "Latency (ms)"
#set key font "Arial, 15"

#set xlabel "x-units" font "Arial, 14"
#set ylabel "y-units" font "Arial, 14"

set ytic nomirror
set y2tic nomirror
 
#set style fill pattern 4
#set style data histogram
#set style histogram gap 2
#set key font ",10"
#set xtics font "Verdana,10" 

set size 1,0.8
#set key at 5,7500
#set xrange [0:]
#set yrange[1:10000000]
set yrange[0:]
#set logscale y
#set logscale y2
#set y2range[1:1000000]
set y2range[0:50000]
set yrange[0:8000]
set logscale y2
 
set xtics rotate
#set xtics border in scale 0,0 nomirror rotate by 45  offset character -1, -4, 0

#set arrow from -1,515 to 14,515 nohead ls 6 lw 4
#set label "Traditional-EPC ---" at 10,23000 nopoint tc lt 6

#set boxwidth 0.5
#set style fill pattern 2 border
#set style fill pattern 21
#set style fill solid
#set style data histogram
#set style histogram gap 2

plot 'dynScaling.dat' using 2:xtic(int($0)%2 == 0 ? stringcolumn(1) : '') title 'Incoming Load' ls 7 w linespoints ,\
	'dynScaling.dat' using 6 title 'SteerOffload: Processed Load'  ls 2 w linespoints,\
	'dynScaling.dat' using 7 axes x1y2 title 'SteerOffload: Latency'  ls 4 w linespoints 

unset style data
unset style histogram

