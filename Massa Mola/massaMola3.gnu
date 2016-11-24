reset

set yrange[0.1:0.85]
set xrange[0.04:0.3]
set ylabel 'P(N)'
set xlabel '{/Symbol D}x(m)'
set key box left top
set key heigh 1.5
set key spacing 2

f(x) = a+b*x
fit f(x) 'MassaMola3.dat' via a,b
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)
plot 'MassaMola3.dat' ps 1 title 'Mola de 6cm',f(x) t title_f(a,b) ls -1 lw 1.5 
set terminal postscript eps

set output 'Massa_Mola3.eps'
replot
set term x11
