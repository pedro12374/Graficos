reset

#set xrange [300:370]
#set yrange [0:315]
set ylabel 'Velocidade(m/s)'
set xlabel 'Temperatura(k)'
set mytics
show mytics
set key box left top
set key spacing 2.5
set key height 1.5


f1(x) = a+b*x
f2(x) = c+d*x
f3(x) = e+f*x

fit f1(x) 'Vel_Som_f1(VxT).dat' via a,b
fit f2(x) 'Vel_Som_f2(VxT).dat' via c,d
fit f3(x) 'Vel_Som_f3(VxT).dat' via e,f

title_f1(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)
title_f2(c,d) = sprintf('g(x) = %.3f+%.3fx', c, d)
title_f3(e,f) = sprintf('h(x) = %.3f+%.3fx', e, f)

plot 'Vel_Som_f1(VxT).dat' ps 1 title 'Frequencia de 750 Hz',f1(x) t title_f1(a,b) lw 1.5,'Vel_Som_f2(VxT).dat' ps 1 title 'Frequencia de 853 Hz',f2(x) t title_f2(c,d) lw 1.5, 'Vel_Som_f3(VxT).dat' ps 1 title 'Frequencia de 953 Hz',f3(x) t title_f3(e,f) lw 1.5

set terminal postscript eps

set output 'Vel_Som(VxT).eps'
replot
set term x11
