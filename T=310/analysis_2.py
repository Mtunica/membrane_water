import numpy as np
import sys
import matplotlib.pyplot as plt

time_steps = 100
num_particles=int(sys.argv[2])

mu_x=[]
mu_y=[]
mu_z=[]

dt=10.0/float(time_steps-1)


h1 = np.zeros((int(num_particles/3),3))
h2 = np.zeros((int(num_particles/3),3))
oh2 = np.zeros((int(num_particles/3),3))

boolean=True

np.seterr('raise')

mu_x_av =  np.zeros((time_steps,int(num_particles/3)))
mu_y_av =  np.zeros((time_steps,int(num_particles/3)))
mu_z_av =  np.zeros((time_steps,int(num_particles/3)))



ii=0
count=0
count_end=0
with open(sys.argv[1]) as filein:
    for line in filein:
        line=line.split()


        if(line[0]=="OH2"):
            line0=line
            try:
            	line=next(filein)
            except:
            	exit()
            line=line.split()

            if(line[0] == "H1"):
                line1=line
                try:
                	line=next(filein)
                except:
                	exit()
                line=line.split()

                if(line[0] == "H2"):
                    oh2[ii,0] = float(line0[1])
                    oh2[ii,1] = float(line0[2])
                    oh2[ii,2] = float(line0[3])


                    h1[ii,0] = float(line1[1])
                    h1[ii,1] = float(line1[2])
                    h1[ii,2] = float(line1[3])

                    h2[ii,0] = float(line[1])
                    h2[ii,1] = float(line[2])
                    h2[ii,2] = float(line[3])


                    ii=ii+1

                    count_end=max(ii,count_end)

        if line[0] == sys.argv[2]:
            if boolean==False:
                for jj in range(len(oh2)):
                    dx1= oh2[jj,0]- h1[jj,0]
                    dy1= oh2[jj,1]- h1[jj,1]
                    dz1= oh2[jj,2]- h1[jj,2]



                    norm1=np.linalg.norm([dx1,dy1,dz1])
                    if(norm1 > 0):
                        dx1=dx1/norm1
                        dy1=dy1/norm1
                        dz1=dz1/norm1

                    dx2= oh2[jj,0]- h2[jj,0]
                    dy2= oh2[jj,1]- h2[jj,1]
                    dz2= oh2[jj,2]- h2[jj,2]


                    norm2=np.linalg.norm([dx2,dy2,dz2])
                    if(norm2 > 0):
                        dx2=dx2/norm2
                        dy2=dy2/norm2
                        dz2=dz2/norm2

                    mu_x_av[count,jj] = dx1+dx2
                    mu_y_av[count,jj] = dy1+dy2
                    mu_z_av[count,jj] = dz1+dz2

                    norm=np.linalg.norm([mu_x_av[count,jj],mu_y_av[count,jj],mu_z_av[count,jj]])
                    if(norm > 0):
                         mu_x_av[count,jj]=mu_x_av[count,jj]/norm
                         mu_y_av[count,jj]=mu_y_av[count,jj]/norm
                         mu_z_av[count,jj]=mu_z_av[count,jj]/norm


                count=count+1
                h1 = np.zeros((count_end,3))
                h2 = np.zeros((count_end,3))
                oh2 = np.zeros((count_end,3))
                line = next(filein)
                ii=0
            else:
                boolean=False
                line = next(filein)

for jj in range(len(oh2)):
    dx1= oh2[jj,0]- h1[jj,0]
    dy1= oh2[jj,1]- h1[jj,1]
    dz1= oh2[jj,2]- h1[jj,2]

    norm1=np.linalg.norm([dx1,dy1,dz1])
    if(norm1 > 0):
        dx1=dx1/norm1
        dy1=dy1/norm1
        dz1=dz1/norm1


    dx2= oh2[jj,0]- h2[jj,0]
    dy2= oh2[jj,1]- h2[jj,1]
    dz2= oh2[jj,2]- h2[jj,2]

    norm2=np.linalg.norm([dx2,dy2,dz2])
    if(norm2 > 0):
        dx2=dx2/norm2
        dy2=dy2/norm2
        dz2=dz2/norm2

    mu_x_av[count,jj] = dx1+dx2
    mu_y_av[count,jj] = dy1+dy2
    mu_z_av[count,jj] = dz1+dz2

    norm=np.linalg.norm([mu_x_av[count,jj],mu_y_av[count,jj],mu_z_av[count,jj]])
    if(norm > 0):
        mu_x_av[count,jj]=mu_x_av[count,jj]/norm
        mu_y_av[count,jj]=mu_y_av[count,jj]/norm
        mu_z_av[count,jj]=mu_z_av[count,jj]/norm


count=count+1

av=[]
av2=[]

mu_av =  np.zeros((time_steps))

for ii in range(time_steps):
    for jj in range(count_end):
            av2.append(mu_x_av[0,jj]*mu_x_av[0,jj]+mu_y_av[0,jj]*mu_y_av[0,jj]+mu_z_av[0,jj]*mu_z_av[0,jj])
            av.append(mu_x_av[ii,jj]*mu_x_av[0,jj]+mu_y_av[ii,jj]*mu_y_av[0,jj]+mu_z_av[ii,jj]*mu_z_av[0,jj])

    mu_av[ii] = np.average(av)/np.average(av2)
    av.clear()
    av2.clear()
dt=0.2
with open(sys.argv[3], "w") as fileout:

	for ii in range(time_steps):
		fileout.write(str(float(ii+1)*10.0*dt/100.0)+ " " + str(mu_av[ii]) +"\n")
