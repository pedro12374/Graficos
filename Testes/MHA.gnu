reset

#set xrange [2:23]
#set mxtics 5
#show mxtics
#set yrange [-900:900]
#set mytics 10
#show mytics
set ylabel '{/Symbol q}({/Symbol \260})'
set xlabel 'T(s)'
f(x) = a/exp(x*b)
a=1;b=0.0001
fit f(x) 'MHA.dat' via a,b
set sample 200
title_f(a,b) = sprintf('f(x) = %.1fe^{-%.2fx10^{-4}t/2}', a, b*2000)
g(x) = f(x)*cos(2.247*x)

title_g(a,b) = sprintf('g(x) = %.1fe^{-%.2fx10^{-4}t/2}cos({/Symbol w}t)', a, b*2000)
plot 'MHA.dat' ps 2 title 'Movimento Amortecido' ,f(x) t title_f(a,b) lw 1.5 ,-f(x),g(x) t title_g(a,b)

set terminal postscript eps

set output 'MHA_CONVERT_UP.eps'
replot
set term x11

