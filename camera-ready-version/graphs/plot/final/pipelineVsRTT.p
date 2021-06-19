#!/bin/bash
set autoscale #scales axes automatically
unset log #remove any log-scaling
unset label #remove any prev labels
set terminal postscript eps enhanced color font 'Arial,18'
#set termoption enhanced
set output 'pipelineVsRTT.eps'
#set xtic 3
set ytic auto
set ytic nomirror
set y2tic auto
#set title "LTE-EPC: Application End-to-end Delay(ms)"
set xlabel "Payload size"
set ylabel "Throughput (Mpps)"
set y2label "Latency ({/Symbol m}s)"

set style fill pattern 4
set style data histogram
#set style histogram gap 2

set style histogram errorbars gap 2 

set size 1,0.6
set key above vertical maxrows 2
#set key at 2.5,48
#set xrange [0:10]
set yrange[0:8]
set y2range[0:300]
#set xtics border in scale 0,0 nomirror rotate by 45  offset character -1, -4, 0


plot newhistogram fs pattern 2, 'pipelineVsRTT.dat' using 12:12:12:xtic(1) title 'SoftUPF Throughput' lc rgb 'red'lw 3,\
     'pipelineVsRTT.dat' using 13:13:13 title 'SteerOffload Throughput' lc rgb 'black' lw 3 ,\
	'pipelineVsRTT.dat' using 4:5:6 axes x1y2 title 'SoftUPF latency' lc rgb 'red' lw 3 ,\
	'pipelineVsRTT.dat' using 9:10:11 axes x1y2 title 'SteerOffload latency' lc rgb 'black' lw 3



#plot newhistogram fs pattern 4, 'pipelineVsRTT.dat' using 12:12:12:xtic(1) title 'SoftUPF Throughput' lc rgb 'red'lw 3,\
     'pipelineVsRTT.dat' using 13:13:13 title 'SteerOffload Throughput' lc rgb 'medium-blue' lw 3 ,\
     'pipelineVsRTT.dat' using 4 axes x1y2 title 'SoftUPF latency' lc rgb 'red' lw 3 with points ,\
	'pipelineVsRTT.dat' using 9 axes x1y2 title 'SteerOffload latency' lc rgb 'medium-blue' lw 3 with points

     #'pipelineVsRTT.dat' using 4:5:6 axes x1y2 title 'SoftUPF latency' lc rgb 'red' lw 3, \
     #'pipelineVsRTT.dat' using 9:10:11 axes x1y2 title 'SteerOffload latency' lc rgb 'medium-blue' lw 3


#plot newhistogram fs pattern 4, 'pipelineVsRTT.dat' using 3:4:5:xtic(1) title 'Centralized mode' lc rgb 'red'lw 2,\
     'pipelineVsRTT.dat' using 3:4:5 title 'Offload mode' lc rgb 'black' lw 2 , \
     'pipelineVsRTT.dat' using 3:4:5 title 'Cuttlefish' lc rgb 'medium-blue' lw 2, \
     'pipelineVsRTT.dat' using 3:4:5 title 'Cuttlefish' lc rgb 'medium-blue' lw 2

unset style data
unset style histogram

