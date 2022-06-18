import numpy as np
import sys


with open(sys.argv[1]) as filein:

	for line in filein:
		line=line.split()
		time =line
		line=next(filein)
		line=line.split()
		data=line
		
print(time)
print(data)

dt=0.2
with open(sys.argv[2],"w") as fileout:

	for i in range(len(time)):
	
		fileout.write(str(float(i+1)*dt/10.0) +" " + str(data[i]) + "\n")
