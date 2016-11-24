reset

#set yrange[0.75:1.30]
#set mytics 0.2
#show mytics
#set xrange[0.050:0.120]
#set mxtics 0.01
#show mxtics
#set ylabel 'T(s)'
#set xlabel 'M(kg)'
#set key box left top
#set key heigh 1.5
#set key spacing 2
set grid

f(x) = a*x**b
fit f(x) 'Massa-Mola(TxM).dat' via a,b
title_f(a,b) = sprintf('f(x) = %.3fx^{%.3f', a, b)

g(x) = c*x**d
fit g(x) 'Massa-Mola(TxK).dat' via c,d
title_g(c,d) = sprintf('g(x) = %.3fx^{%.3f', c, d)

h(x)= f(x)*g(x)

plot 'Massa-Mola(TxK).dat' title 'Mola de aaa cm',g(x) t title_g(c,d),'Massa-Mola(TxM).dat' title 'Mola de 6 cm',f(x) t title_f(a,b), h(x)
