reset

set xrange [0.45:1.5]
set yrange [6000:18000]
set ylabel 'Frequencia(Hz^{2})'
set xlabel 'Tensao no fio(N)'
set mytics
show mytics
set mxtics
show mxtics
show grid
set key box left top
set key spacing 2.5
set key height 1.5


f(x) = a+b*x

fit f(x) 'Corda_N5(PxF).dat' via a,b

title_f(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)

plot 'Corda_N5(PxF).dat' ps 1 title '5 Ventres',f(x) t title_f(a,b) ls -1 lw 1.5


set terminal postscript eps

set output 'Corda_N5(PxF).eps'
replot
set term x11
