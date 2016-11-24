reset
set logscale

set xrange [75:185]
set yrange[1.70:2.80]
set xlabel "L(cm)"
set ylabel "T(s)"
unset logscale cb
set key box left top
set xtics   (80.0000, 90.0000, 100.000, 110.000, 120.000, 130.000, 140.000, 150.000, 160.000, 170.000, 180.000)
set ytics   (1.80000, 1.90000, 2.00000, 2.10000, 2.20000, 2.30000, 2.40000, 2.50000, 2.60000, 2.70000)
set grid
set title 'Grafico 1'

f(x) = a*x**b
fit f(x) 'grafico.dat' using 1:2 via  a,b
title_f(a,b) = sprintf('f(x) = Cx^{n}, C = %f e N = %f', a*10, b)

plot 'grafico.dat' using 1:2 title 'TxL', f(x) t title_f(a,b)

