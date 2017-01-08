reset

#set xscale [-100:]
set key box left top
set ylabel 'Temperatra(mmHg)'
set xlabel 'Temperatura(ºk)'
set mytics
set mxtics


f(x) = a+x*b
fit f(x) 'Tpm(KxmmHg).dat' using 1:2 via  a,b
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx' , a, b)

plot 'Tpm(KxmmHg).dat' using 1:2 title 'Temperaturas', f(x) t title_f(a,b)

set terminal postscript eps

set output 'Termometros.eps'
replot
set term x11
