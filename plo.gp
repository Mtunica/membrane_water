set term png size 1000,500
set output "autocorrelation.png"

set yrange[0.3:1]
set xrange[0:2]

set xlabel("Time (ps)")
set ylabel("Autocorrelation function of the dipole vector")
set xtics nomirror out
set ytics nomirror out


f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 

fit f1(x) "0_3_310.dat" u 1:2 via b1,c1	
fit f2(x) "3_6_310.dat" u 1:2 via b2,c2
fit f3(x) "6_9_310.dat" u 1:2 via b3,c3
fit f4(x) "9_15_310.dat" u 1:2 via b4,c4
fit f5(x) "all_310.dat" u 1:2 via b5,c5	

set key horizontal out

plot "0_3_310.dat" u 1:2 lc rgb "red" t "0-3 for 310 K" ,f1(x) lc rgb "red" notitle,\
     "3_6_310.dat" u 1:2 lc rgb "blue" t "3-6 for 310 K",f2(x) lc rgb "blue" notitle,\
     "6_9_310.dat" u 1:2  lc rgb "dark-green" t "6-9 for 310 K",f3(x) lc rgb "dark-green" notitle,\
     "9_15_310.dat" u 1:2  lc rgb "dark-yellow" t "9-15 for 310 K",f4(x) lc rgb "dark-yellow" notitle,\
     "all_310.dat" u 1:2   lc rgb "brown" t "All for 310 K",f5(x) lc rgb "brown" notitle
     
 
set print "data_correlation.csv"

print  b1 , "," , b1_err ,  "," , c1 ,  "," , c1_err
print  b2 , "," , b2_err ,  "," , c2 ,  "," , c2_err
print  b3 , "," , b3_err ,  "," , c3 ,  "," , c3_err
print  b4 , "," , b4_err ,  "," , c4 ,  "," , c4_err 
print  b5 , "," , b5_err ,  "," , c5 ,  "," , c5_err


set term png size 650,500
set output "autocorrelation_305.png"

set xlabel("Time (ps)")
set ylabel("Autocorrelation function of the dipole vector")
set xtics nomirror out
set ytics nomirror out

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 

fit f1(x) "0_3_305.dat" u 1:2 via b1,c1
fit f2(x) "3_6_305.dat" u 1:2 via b2,c2	
fit f3(x) "6_9_305.dat" u 1:2 via b3,c3	
#fit f4(x) "9_15_305.dat" u 1:2 via b4,c4	
fit f5(x) "all_305.dat" u 1:2 via b5,c5	

set key horizontal out

plot "0_3_305.dat" u 1:2 lc rgb "red" t "0-3 for 305 K" ,f1(x) lc rgb "red" notitle,\
     "3_6_305.dat" u 1:2  lc rgb "blue" t "3-6 for 305 K",f2(x) lc rgb "blue" notitle,\
     "6_9_305.dat" u 1:2  lc rgb "dark-green" t "6-9 for 305 K",f3(x) lc rgb "dark-green" notitle,\
     "all_305.dat" u 1:2  lc rgb "brown" t "All for 305 K",f5(x) lc rgb "brown" notitle
     
 
set print "data_correlation_305.csv"

print  b1 , "," , b1_err ,  "," , c1 ,  "," , c1_err
print  b2 , "," , b2_err ,  "," , c2 ,  "," , c2_err
print  b3 , "," , b3_err ,  "," , c3 ,  "," , c3_err
print  b5 , "," , b5_err ,  "," , c5 ,  "," , c5_err


set term png size 650,500
set output "autocorrelation_300.png"

set xlabel("Time (ps)")
set ylabel("Autocorrelation function of the dipole vector")
set xtics nomirror out
set ytics nomirror out

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 

fit f1(x) "0_3_300.dat" u 1:2 via b1,c1
fit f2(x) "3_6_300.dat" u 1:2 via b2,c2	
fit f3(x) "6_9_300.dat" u 1:2 via b3,c3	
#fit f4(x) "9_15_300.dat" u 1:2 via b4,c4	
fit f5(x) "all_300.dat" u 1:2 via b5,c5	

set key horizontal out

plot "0_3_300.dat" u 1:2 lc rgb "red" t "0-3 for 300 K" ,f1(x) lc rgb "red" notitle,\
     "3_6_300.dat" u 1:2  lc rgb "blue" t "3-6 for 300 K",f2(x) lc rgb "blue" notitle,\
     "6_9_300.dat" u 1:2  lc rgb "dark-green" t "6-9 for 300 K",f3(x) lc rgb "dark-green" notitle,\
     "all_300.dat" u 1:2  lc rgb "brown" t "All for 300 K",f5(x) lc rgb "brown" notitle
     
 
set print "data_correlation_300.csv"

print  b1 , "," , b1_err ,  "," , c1 ,  "," , c1_err
print  b2 , "," , b2_err ,  "," , c2 ,  "," , c2_err
print  b3 , "," , b3_err ,  "," , c3 ,  "," , c3_err
print  b5 , "," , b5_err ,  "," , c5 ,  "," , c5_err



set term png size 650,500
set output "autocorrelation_295.png"

set xlabel("Time (ps)")
set ylabel("Autocorrelation function of the dipole vector")
set xtics nomirror out
set ytics nomirror out

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 


fit f1(x) "0_3_295.dat" u 1:2 via b1,c1	
fit f2(x) "3_6_295.dat" u 1:2 via b2,c2	
fit f3(x) "6_9_295.dat" u 1:2 via b3,c3	
fit f5(x) "all_295.dat" u 1:2 via b5,c5	

set key horizontal out

plot "0_3_295.dat" u 1:2 lc rgb "red" t "0-3 for 295 K" ,f1(x) lc rgb "red" notitle,\
     "3_6_295.dat" u 1:2  lc rgb "blue" t "3-6 for 295 K",f2(x) lc rgb "blue" notitle,\
     "6_9_295.dat" u 1:2  lc rgb "dark-green" t "6-9 for 295 K",f3(x) lc rgb "dark-green" notitle,\
     "all_295.dat" u 1:2  lc rgb "brown" t "All for 295 K",f5(x) lc rgb "brown" notitle
     
 
set print "data_correlation_295.csv"

print  b1 , "," , b1_err ,  "," , c1 ,  "," , c1_err
print  b2 , "," , b2_err ,  "," , c2 ,  "," , c2_err
print  b3 , "," , b3_err ,  "," , c3 ,  "," , c3_err
print  b4 , "," , b4_err ,  "," , c4 ,  "," , c4_err 
print  b5 , "," , b5_err ,  "," , c5 ,  "," , c5_err



set term png size 650,500
set output "autocorrelation_290.png"

set xlabel("Time (ps)")
set ylabel("Autocorrelation function of the dipole vector")
set xtics nomirror out
set ytics nomirror out

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 


fit f1(x) "0_3_290.dat" u 1:2 via b1,c1	
fit f2(x) "3_6_290.dat" u 1:2 via b2,c2	
fit f3(x) "6_9_290.dat" u 1:2 via b3,c3	
fit f4(x) "9_15_290.dat" u 1:2 via b4,c4	
fit f5(x) "all_290.dat" u 1:2 via b5,c5	

set key horizontal out

plot "0_3_290.dat" u 1:2 lc rgb "red" t "0-3 for 290 K" ,f1(x) lc rgb "red"  notitle,\
     "3_6_290.dat" u 1:2  lc rgb "blue" t "3-6 for 290 K",f2(x) lc rgb "blue"  notitle,\
     "6_9_290.dat" u 1:2  lc rgb "dark-green" t "6-9 for 290 K",f3(x) lc rgb "dark-green"  notitle,\
     "9_15_290.dat" u 1:2  lc rgb "dark-yellow" t "9-15 for 290 K",f4(x) lc rgb "dark-yellow"  notitle,\
     "all_290.dat" u 1:2  lc rgb "brown" t "All for 290 K",f5(x) lc rgb "brown"  notitle
     
 
set print "data_correlation_290.csv"

print  b1 , "," , b1_err ,  "," , c1 ,  "," , c1_err
print  b2 , "," , b2_err ,  "," , c2 ,  "," , c2_err
print  b3 , "," , b3_err ,  "," , c3 ,  "," , c3_err
print  b4 , "," , b4_err ,  "," , c4 ,  "," , c4_err 
print  b5 , "," , b5_err ,  "," , c5 ,  "," , c5_err




set term png size 650,500
set output "autocorrelation_285.png"

set xlabel("Time (ps)")
set ylabel("Autocorrelation function of the dipole vector")
set xtics nomirror out
set ytics nomirror out

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5)

fit f1(x) "0_3_285.dat" u 1:2 via b1,c1	
fit f2(x) "3_6_285.dat" u 1:2 via b2,c2	
fit f3(x) "6_9_285.dat" u 1:2 via b3,c3	
fit f4(x) "9_15_285.dat" u 1:2 via b4,c4	
fit f5(x) "all_285.dat" u 1:2 via b5,c5	

set key horizontal out

plot "0_3_285.dat" u 1:2 lc rgb "red" t "0-3 for 285 K" ,f1(x) lc rgb "red"  notitle,\
     "3_6_285.dat" u 1:2  lc rgb "blue" t "3-6 for 285 K",f2(x) lc rgb "blue"  notitle,\
     "6_9_285.dat" u 1:2  lc rgb "dark-green" t "6-9 for 285 K",f3(x) lc rgb "dark-green"  notitle,\
     "9_15_285.dat" u 1:2  lc rgb "dark-yellow" t "9-15 for 285 K",f4(x) lc rgb "dark-yellow"  notitle,\
     "all_285.dat" u 1:2  lc rgb "brown" t "All for 285 K",f5(x) lc rgb "brown"  notitle
     
 
set print "data_correlation_285.csv"

print  b1 , "," , b1_err ,  "," , c1 ,  "," , c1_err
print  b2 , "," , b2_err ,  "," , c2 ,  "," , c2_err
print  b3 , "," , b3_err ,  "," , c3 ,  "," , c3_err
print  b4 , "," , b4_err ,  "," , c4 ,  "," , c4_err 
print  b5 , "," , b5_err ,  "," , c5 ,  "," , c5_err




