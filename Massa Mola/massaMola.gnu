reset

#set yrange[0:1]
set xrange[0:0.3]
set mxtics
set mytics
show mytics
show mxtics
set ylabel 'P(N)'
set xlabel '{/Symbol D}x(m)'
set key box left top
set key heigh 1.5
set key spacing 2

f(x) = a+b*x #MassaMola 1,5cm
fit f(x) 'MassaMola1.dat' via a,b
title_f(a,b) = sprintf('f(x) = %.3f+%.3fx', a, b)


g(x) = c+d*x #MassaMola 3,0 cm
fit g(x) 'MassaMola2.dat' via c,d
title_g(a,b) = sprintf('g(x) = %.3f+%.3fx', c, d)
#plot 'MassaMola2.dat' ps 1 title 'Mola de 3cm',f(x) t title_f(a,b) ls -1 lw 1.5 


h(x) = e+f*x #MassaMola 6,0 cm
fit h(x) 'MassaMola3.dat' via e,f
title_h(e,f) = sprintf('h(x) = %.3f+%.3fx', e, f)
#plot 'MassaMola3.dat' ps 1 title 'Mola de 6cm',f(x) t title_f(a,b) ls -1 lw 1.5 




plot 'MassaMola1.dat' with yerrorbars ps 1 title 'Mola de 1,5cm',f(x) t title_f(a,b)  lw 1.5,'MassaMola2.dat' with yerrorbars ps 1 title 'Mola de 3cm',g(x) t title_g(c,d)  lw 1.5,'MassaMola3.dat' with yerrorbars ps 1 title 'Mola de 6cm',h(x) t title_h(e,f)  lw 1.5  
set terminal postscript eps

set output 'Massa_Molas.eps'
replot
set term x11
