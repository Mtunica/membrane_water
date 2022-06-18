set term png size 650,500

set output "c_def.png"

set xrange[284:311]
set linestyle 1 lw 1

set xlabel("Temperature (K)")
set ylabel("Characteristic relaxation time (ps) ")
set xtics nomirror out
set ytics nomirror out


set key horizontal out

plot "data_0_3.dat" u 1:4:5 w yerrorbars  lc "red" t "Region: 0-3", "data_0_3.dat" u 1:4 with lines  lc "red" notitle,\
     "data_3_6.dat" u 1:4:5 w yerrorbars lc  "blue" t "Region: 3-6","data_3_6.dat" u 1:4 with lines lc rgb "blue" notitle,\
     "data_6_9.dat" u 1:4:5 w yerrorbars lc  "dark-green" t "Region: 6-9", "data_6_9.dat" u 1:4 with lines lc rgb "dark-green" notitle,\
     "data_all.dat" u 1:4:5 w yerrorbars lc  "black" t "Region: All", "data_all.dat" u 1:4 with lines lc rgb "black" notitle



set term png size 650,500

set output "b_def.png"

set xrange[284:311]
set linestyle 1 lw 1

set xlabel("Temperature (K)")
set ylabel("Stretched exponent")
set xtics nomirror out
set ytics nomirror out


set key horizontal out

plot "data_0_3.dat" u 1:2:3 w yerrorbars  lc "red" t "Region: 0-3", "data_0_3.dat" u 1:2 with lines  lc "red" notitle,\
     "data_3_6.dat" u 1:2:3 w yerrorbars lc  "blue" t "Region: 3-6","data_3_6.dat" u 1:2 with lines lc rgb "blue" notitle,\
     "data_6_9.dat" u 1:2:3 w yerrorbars lc  "dark-green" t "Region: 6-9", "data_6_9.dat" u 1:2 with lines lc rgb "dark-green" notitle,\
     "data_all.dat" u 1:2:3 w yerrorbars lc  "black" t "Region: All", "data_all.dat" u 1:2 with lines lc rgb "black" notitle


