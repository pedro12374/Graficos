reset

#set yrange[0.1:0.85]
#set xrange[0.01:0.09]
set ylabel 'P(N)'
set xlabel '{/Symbol D}x(m)'
set key box left top
set key heigh 1.5
set key spacing 2
set logscale
unset logscale cb



f(x) = a*x**b
fit f(x) 'MassaMola1.dat' via  a,b
title_f(a,b) = sprintf('f(x) = %3.fx^{%3.f}', a, b)


plot 'MassaMola1.dat' ps 1 title 'Mola de 1,5cm',f(x) t title_f(a,b) ls -1 lw 1.5 
set terminal postscript eps

set output 'Massa_Mola1.eps'
replot
set term x11
