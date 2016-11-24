reset

set yrange [0:22]
set mxtics 5
show mxtics
set xrange [-5:800]
set mytics 5
show mytics
set ylabel '{/Symbol q}({/Symbol \260})'
set xlabel 'T(s)'
f(x) = a/exp(x*b)
a=1;b=0.0001
fit f(x) 'MHA.dat' via a,b
set grid
show grid
title_f(a,b) = sprintf('f(x) = %.1fe^{-%.2fx10^{-4}t/2}', a, b*2000)
plot 'MHA.dat' ps 2 title 'Movimento Amortecido',f(x) t title_f(a,b) ls -1 lw 1.5 


set terminal postscript eps
set output 'MHA_CONVERT.eps'
replot
set term x11

