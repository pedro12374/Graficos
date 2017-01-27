reset

set yrange [0:21]
set xrange [7.5:80]
set mxtics
show mxtics
set mytics 
show mytics
set key box left top
set grid

set ylabel ('{/Symbol h}(%)')
set xlabel ('{/Symbol D}T(K)')

f(x) = a+b*x
g(x) = c+d*x

fit f(x) 'Maquina(NcxT).dat' via a,b
fit g(x) 'Maquina(NrxT).dat' via c,d
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)
title_g(c,d) = sprintf('g(x) = %.3f+%.3fx', c, d)

plot 'Maquina(NcxT).dat' ps 1 title 'Rendimento de Carnot',f(x) t title_f(a,b) ls -1 lw 1.5, 'Maquina(NrxT).dat' ps 1 title 'Rendimento Real',g(x) t title_g(c,d) ls -1 lw 1.5

set terminal postscript eps

set output 'Maquina Termica.eps'
replot
set term x11
