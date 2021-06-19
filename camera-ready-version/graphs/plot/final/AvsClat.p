#!/bin/bash
set autoscale #scales axes automatically
unset log #remove any log-scaling
unset label #remove any prev labels
set terminal postscript eps enhanced color font 'Arial,18'
#set termoption enhanced
set output 'SoftUPFVsPartialDPOffload.eps'
#set xtic 3
set ytic auto
#set y2tic auto
#set title "LTE-EPC: Application End-to-end Delay(ms)"
set xlabel "Payload size"
#set ylabel "Throughput (Mpps)"
set ylabel "Latency ({/Symbol m}s)"

set style fill pattern 4
set style data histogram
#set style histogram gap 2

set style histogram errorbars gap 2 

set size 1,0.8
set key at 1.1,250
#set xrange [0:10]
set yrange[0:280]
#set y2range[0:400]
#set xtics border in scale 0,0 nomirror rotate by 45  offset character -1, -4, 0

plot newhistogram fs pattern 4, 'AvsClat.dat' using 2:3:4:xtic(1) title 'SoftUPF latency' lc rgb 'red' lw 2, \
     'AvsClat.dat' using 5:6:7 title 'PartialDPOffload latency' lc rgb 'medium-blue' lw 2


#plot newhistogram fs pattern 4, 'pipelineVsRTT.dat' using 3:4:5:xtic(1) title 'Centralized mode' lc rgb 'red'lw 2,\
     'pipelineVsRTT.dat' using 3:4:5 title 'Offload mode' lc rgb 'black' lw 2 , \
     'pipelineVsRTT.dat' using 3:4:5 title 'Cuttlefish' lc rgb 'medium-blue' lw 2, \
     'pipelineVsRTT.dat' using 3:4:5 title 'Cuttlefish' lc rgb 'medium-blue' lw 2

unset style data
unset style histogram
