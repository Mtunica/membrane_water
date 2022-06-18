set term png size 650,500

set output "comparation.png"



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
f6(x)=exp(-(x/c6)**b6)


fit f1(x) "0_3_310.dat" u 1:2 via b1,c1	
fit f2(x) "0_3_305.dat" u 1:2 via b2,c2	
fit f3(x) "0_3_300.dat" u 1:2 via b3,c3	
fit f4(x) "0_3_295.dat" u 1:2 via b4,c4	
fit f5(x) "0_3_290.dat" u 1:2 via b5,c5
fit f6(x) "0_3_285.dat" u 1:2 via b6,c6


set print "data_0_3.dat"

print "310" , " " , b1 , " " , b1_err ,  " " , c1 ,  " " , c1_err 
print "305" , " " , b2 , " " , b2_err ,  " " , c2 ,  " " , c2_err
print "300" , " " , b3 , " " , b3_err ,  " " , c3 ,  " " , c3_err 
print "295", " " , b4 , " " , b4_err ,  " " , c4 ,  " " , c4_err 
print "290" , " " , b5 , " " , b5_err ,  " " , c5 ,  " " , c5_err 
print "285", " " ,  b6 , " " , b6_err ,  " " , c6 ,  " " , c6_err 




set key horizontal out

plot "0_3_310.dat" u 1:2 lc rgb "red" t "0-3 for 310 K" ,\
     "0_3_305.dat" u 1:2 lc rgb "blue" t "0-3 for 305 K",\
     "0_3_300.dat" u 1:2 lc rgb "dark-green" t "0-3 for 300 K" ,\
     "0_3_295.dat" u 1:2 lc rgb "black" t "0-3 for 295 K" ,\
     "0_3_290.dat" u 1:2 lc rgb "dark-yellow" t "0-3 for 290 K",\
     "0_3_285.dat" u 1:2 lc rgb "brown" t "0-3 for 285 K"
     
  
set output "comparation2.png"


f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 
f6(x)=exp(-(x/c6)**b6)

b6=0.7
c6=5.0

fit f1(x) "6_9_310.dat" u 1:2 via b1,c1	
fit f2(x) "6_9_305.dat" u 1:2 via b2,c2	
fit f3(x) "6_9_300.dat" u 1:2 via b3,c3	
fit f4(x) "6_9_295.dat" u 1:2 via b4,c4	
fit f5(x) "6_9_290.dat" u 1:2 via b5,c5
fit f6(x) "6_9_285.dat" u 1:2 via b6,c6

set print "data_6_9.dat"

print "310" , " " , b1 , " " , b1_err ,  " " , c1 ,  " " , c1_err 
print "305" , " " , b2 , " " , b2_err ,  " " , c2 ,  " " , c2_err
print "300" , " " , b3 , " " , b3_err ,  " " , c3 ,  " " , c3_err 
print "295", " " , b4 , " " , b4_err ,  " " , c4 ,  " " , c4_err 
print "290" , " " , b5 , " " , b5_err ,  " " , c5 ,  " " , c5_err 
print "285", " " ,  b6 , " " , b6_err ,  " " , c6 ,  " " , c6_err 


plot "6_9_310.dat" u 1:2 lc rgb "red" t "6-9 for 310 K" ,\
     "6_9_305.dat" u 1:2 lc rgb "blue" t "6-9 for 305 K",\
     "6_9_300.dat" u 1:2 lc rgb "dark-green" t "6-9 for 300 K" ,\
     "6_9_295.dat" u 1:2 lc rgb "black" t "6-9 for 295 K",\
     "6_9_290.dat" u 1:2 lc rgb "dark-yellow" t "6-9 for 290 K",\
     "6_9_285.dat" u 1:2 lc rgb "brown" t "6-9 for 285 K"
     
     
set output "comparation3.png"

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 
f6(x)=exp(-(x/c6)**b6)


fit f1(x) "3_6_310.dat" u 1:2 via b1,c1
fit f2(x) "3_6_305.dat" u 1:2 via b2,c2	
fit f3(x) "3_6_300.dat" u 1:2 via b3,c3	
fit f4(x) "3_6_295.dat" u 1:2 via b4,c4	
fit f5(x) "3_6_290.dat" u 1:2 via b5,c5
fit f6(x) "3_6_285.dat" u 1:2 via b6,c6

set print "data_3_6.dat"

print "310" , " " , b1 , " " , b1_err ,  " " , c1 ,  " " , c1_err 
print "305" , " " , b2 , " " , b2_err ,  " " , c2 ,  " " , c2_err
print "300" , " " , b3 , " " , b3_err ,  " " , c3 ,  " " , c3_err 
print "295", " " , b4 , " " , b4_err ,  " " , c4 ,  " " , c4_err 
print "290" , " " , b5 , " " , b5_err ,  " " , c5 ,  " " , c5_err 
print "285", " " ,  b6 , " " , b6_err ,  " " , c6 ,  " " , c6_err 
#print "280", " " , b7 , " " , b7_err ,  " " , c7 ,  " " , c7_err


plot "3_6_310.dat" u 1:2 lc rgb "red" t "3-6 for 310 K" ,\
     "3_6_305.dat" u 1:2 lc rgb "blue" t "3-6 for 305 K",\
     "3_6_300.dat" u 1:2 lc rgb "dark-green" t "3-6 for 300 K" ,\
     "3_6_295.dat" u 1:2 lc rgb "black" t "3-6 for 295 K",\
     "3_6_290.dat" u 1:2 lc rgb "dark-yellow" t "3-6 for 290 K",\
     "3_6_285.dat" u 1:2 lc rgb "brown" t "3-6 for 285 K"
     
     
set output "comparation4.png"

f1(x)=exp(-(x/c1)**b1)
f2(x)=exp(-(x/c2)**b2) 
f3(x)=exp(-(x/c3)**b3)  
f4(x)=exp(-(x/c4)**b4) 
f5(x)=exp(-(x/c5)**b5) 
f6(x)=exp(-(x/c6)**b6)


fit f1(x) "all_310.dat" u 1:2 via b1,c1
fit f2(x) "all_305.dat" u 1:2 via b2,c2	
fit f3(x) "all_300.dat" u 1:2 via b3,c3	
fit f4(x) "all_295.dat" u 1:2 via b4,c4	
fit f5(x) "all_290.dat" u 1:2 via b5,c5
fit f6(x) "all_285.dat" u 1:2 via b6,c6

set print "data_all.dat"

print "310" , " " , b1 , " " , b1_err ,  " " , c1 ,  " " , c1_err 
print "305" , " " , b2 , " " , b2_err ,  " " , c2 ,  " " , c2_err
print "300" , " " , b3 , " " , b3_err ,  " " , c3 ,  " " , c3_err 
print "295", " " , b4 , " " , b4_err ,  " " , c4 ,  " " , c4_err 
print "290" , " " , b5 , " " , b5_err ,  " " , c5 ,  " " , c5_err 
print "285", " " ,  b6 , " " , b6_err ,  " " , c6 ,  " " , c6_err 


plot "all_310.dat" u 1:2 lc rgb "red" t "All for 310 K" ,\
     "all_305.dat" u 1:2 lc rgb "blue" t "All for 305 K",\
     "all_300.dat" u 1:2 lc rgb "dark-green" t "All for 300 K" ,\
     "all_295.dat" u 1:2 lc rgb "black" t "All for 295 K",\
     "all_290.dat" u 1:2 lc rgb "dark-yellow" t "All for 290 K",\
     "all_285.dat" u 1:2 lc rgb "brown" t "All for 285 K"
     
     
