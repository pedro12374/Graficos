reset

set yrange [100:700]
set xrange [30:90]
set key box left top


set ylabel ('{/Symbol D}L({/Symbol m}xm)')
set xlabel ('Temperatura(ºC)')

f(x) = a+b*x
fit f(x) 'Variacao(LxC).dat' via a,b
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)
plot 'Variacao(LxC).dat' ps 1 title 'Material Dilatado',f(x) t title_f(a,b) ls -1 lw 1.5 
set terminal postscript eps

set output 'Dilatacao Termica.eps'
replot
set term x11
