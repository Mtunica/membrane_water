 
from atomsel import *
from molecule import *
import sys

  
mol=load('psf','../0_Simulation/Equilibrat_NPT/estructura_membranaDMPC.psf')

# Available trajectory files:
traject = '../0_Simulation/Produccio_NVT/NVT.dcd'

fout=open('trajectory.xyz', 'w')


read(mol,'dcd',traject,waitfor=-1)
tot = atomsel('all')
water = atomsel('water')

water1 = atomsel('water and within 3 of lipid')
water2 = atomsel('water and (not within 3 of lipid) and (within 9 of lipid)')
water3 = atomsel('water and (not within 9 of lipid) and (within 15 of lipid)')

Nframes = 10
#Nframes = numframes(mol)
for n in range(Nframes):
	fout.write("%i \n %i\n"%(len(water), n))
	water.frame=n
#  water.update()  if this line is not commented it updates the selection every frame. 
	xW = water.get('x')
	yW = water.get('y')
	zW = water.get('z')
	nameW = water.get('name')
	  
	for k in range(len(water)):
		fout.write("%s   %16.4f%16.4f%16.4f\n"%(nameW[k], xW[k], yW[k], zW[k]))

fout.close()
sys.exit()
	    
	  
	  
	
	
