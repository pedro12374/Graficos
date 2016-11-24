reset
#set logscale

#set yrange[0.75:1.30]
#set xrange[0.050:0.120]
set ylabel 'T(s)'
set xlabel 'K(N/M)'
#unset logscale cb
set key box right top
set key heigh 1.5
set key spacing 2
set grid

f(x) = a*x**b
fit f(x) 'Massa-Mola(TxK).dat' via a,b
title_f(a,b) = sprintf('f(x) = %.3fx^{%.3f', a, b)
plot 'Massa-Mola(TxK).dat' with yerrorbars ps 1 title 'Mola de 6 cm',f(x) t title_f(a,b) ls -1 lw 1.5 
set terminal postscript eps

set output 'Massa-Mola(TxK).eps'
replot
set term x11
