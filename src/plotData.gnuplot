## This script plots data points from a file

set title "Force Deflection Data"
set xlabel "Deflection (m)"
set ylabel "Force (kN)"

set xrange [0.001:0.005]
set yrange [20:500]

set autoscale
# set logscale
set logscale y

set grid

# set label "Yield point" at 0.003, 260

# plot a best-fit line from data
f(x) = a*x + b
fit f(x) "../data/force.dat" using 1:2 via a, b
title_f(a,b) = sprintf('f(x) = %.2fx + %.2f', a, b)

plot \
     "../data/force.dat" using 1:2 title "Column" with lines, \
     "../data/force.dat" using 1:3 title "Beam" with steps, \
     f(x) title title_f(a,b)

