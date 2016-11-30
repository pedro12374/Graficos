reset
set logscale
set yrange[20:120]
set key box left top
set ylabel 'Frequencia(Hz)'
set xlabel 'Ventres'
set mytics
set mxtics
unset logscale cb

f(x) = a*x**b
fit f(x) 'Corda_M3(NxF).dat' using 1:2 via  a,b
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx' , a, b)

plot 'Corda_M3(NxF).dat' using 1:2 title 'Normalizado', f(x) t title_f(a,b)

set terminal postscript eps

set output 'Corda_Normalizada.eps'
replot
set term x11
