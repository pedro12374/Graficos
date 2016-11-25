reset

set xrange [0:2]
set yrange [20:110]
set ylabel 'Frequencia(Hz)'
set xlabel '1/{/Symbol \154}(m^{-1})'
set key box left top

f(x) = a+b*x
fit f(x) 'Corda_M3(LBxF).dat' via a,b
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)

plot 'Corda_M3(LBxF).dat',f(x) t title_f(a,b) ls -1 lw 1.5

set terminal postscript eps

set output 'Corda(LBxF).eps'
replot
set term x11
