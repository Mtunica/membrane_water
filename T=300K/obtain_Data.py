import numpy as np
import sys

time=[]
data=[]

with open(sys.argv[1]) as filein:

	for line in filein:

		if "#" in line:
			continue
		else:
			line=line.split()
			time.append(float(line[1]))
			data.append(float(line[2]))

dt=0.2
with open(sys.argv[2],"w") as fileout:

	for i in range(len(time)):

		fileout.write(str(float(i+1)*dt/10.0) +" " + str(data[i]) + "\n")
