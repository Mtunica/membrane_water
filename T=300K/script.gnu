file1="c_rot_all.dat"
file2="c_rot_03.dat"
file3="c_rot_36.dat"
file4="c_rot_69.dat"

load "/home/usuario/Documentos/Master/9_Varis/set1.pal"

set encoding iso_8859_1

set print "fit_coef.dat"
print sprintf("	%s	%s	%s	%s","type","a","b","c")

#set terminal pngcairo enhanced font "verdana,9" fontscale 1.0 size 1024, 768
#set output 'c_rot_all.png'

set xzeroaxis
set yzeroaxis

set xtics auto nomirror
set ytics auto nomirror

set xlabel "t(ps)" enhanced
set ylabel "C^{rot}_{sim}(t)" enhanced

set autoscale
#set xrange[0:15.8]
#set yrange[0:1]
#unset key
set key opaque t r
#set key below width 1

set grid lw 1.2

set title "Phospholipid membrane at T=300K, fit style f(x)=a e^{-(x/b)^c}"

f(x)=a1*exp(-(x/b1)**c1)
g(x)=a2*exp(-(x/b2)**c2)
h(x)=a3*exp(-(x/b3)**c3)
l(x)=a4*exp(-(x/b4)**c4)

fit f(x) file1 u 2:3 via a1,b1,c1
t1=sprintf("a=%.2f, b=%.2f, c=%.2f",a1,b1,c1)
print sprintf("	%s	%g	%g	%g","All",a1,b1,c1)

fit g(x) file2 u 2:3 via a2,b2,c2
t2=sprintf("a=%.2f, b=%.2f, c=%.2f",a2,b2,c2)
print sprintf(" %s      %g      %g      %g","W 0-3",a2,b2,c2)

fit h(x) file3 u 2:3 via a3,b3,c3
t3=sprintf("a=%.2f, b=%.2f, c=%.2f",a3,b3,c3)
print sprintf(" %s      %g      %g      %g","W 3-6",a3,b3,c3)

fit l(x) file4 u 2:3 via a4,b4,c4
t4=sprintf("a=%.2f, b=%.2f, c=%.2f",a4,b4,c4)
print sprintf(" %s      %g      %g      %g","W 6-9",a4,b4,c4)

plot file1 u 2:3 w l ls 1 lw 2 t'All water',\
     f(x)        w l ls -1 lw 1.5 dt 2 t t1,\
     file2 u 2:3 w l ls 2 lw 2 t'Water 0-3 {\305}',\
     g(x)	 w l ls 7 lw 1.5 dt 2 t t2,\
     file3 u 2:3 w l ls 3 lw 2 t'Water 3-6 {\305}',\
     h(x)	 w l ls 5 lw 1.5 dt 2 t t3,\
     file4 u 2:3 w l ls 4 lw 2 t'Water 6-9 {\305}',\
     l(x)	 w l ls 8 lw 1.5 dt 2 t t4

set term qt
reset
pause-1
