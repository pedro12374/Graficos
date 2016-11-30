reset

set xrange [0:6]
set yrange [15:132]
set ylabel 'Frequencia(Hz)'
set xlabel 'Numero de Ventres'
set mytics
show mytics
set key box left top
set key spacing 2.5
set key height 1.5


M1(x) = a+b*x
M2(x) = c+d*x
M3(x) = e+f*x
M4(x) = g+h*x
M5(x) = i+j*x

fit M1(x) 'Corda_M1(NxF).dat' via a,b
fit M2(x) 'Corda_M2(NxF).dat' via c,d
fit M3(x) 'Corda_M3(NxF).dat' via e,f
fit M4(x) 'Corda_M4(NxF).dat' via g,h
fit M5(x) 'Corda_M5(NxF).dat' via i,j

title_M1(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)
title_M2(c,d) = sprintf('g(x) = %.3f+%.3fx', c, d)
title_M3(e,f) = sprintf('h(x) = %.3f+%.3fx', e, f)
title_M4(g,h) = sprintf('i(x) = %.3f+%.3fx', g, h)
title_M5(i,j) = sprintf('j(x) = %.3f+%.3fx', i, j)

plot 'Corda_M1(NxF).dat' ps 1 title 'Massa de 0,05008 Kg',M1(x) t title_M1(a,b) lw 1.5,'Corda_M2(NxF).dat' ps 1 title 'Massa de 0,07456 Kg',M2(x) t title_M2(c,d) lw 1.5, 'Corda_M3(NxF).dat' ps 1 title 'Massa de 0,09298 Kg',M3(x) t title_M3(e,f) lw 1.5,'Corda_M4(NxF).dat' ps 1 title 'Massa de 0,11414 Kg',M4(x) t title_M4(g,h) lw 1.5, 'Corda_M5(NxF).dat' ps 1 title 'Massa de 0,13373 Kg',M5(x) t title_M5(i,j) lw 1.5






set terminal postscript eps

set output 'Corda(NxF).eps'
replot
set term x11
