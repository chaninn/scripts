#!/bin/bash

##########################################################################################

# chmod +x *.sh >>> To activate this shell before execution

##########################################################################################

# Instruction

# Input files can be start from:
	# SMILES in *.txt files (Detail of content is describe below)
	# 3D structure in .mol files

# Extract .txt to .smi files.
	# Preparing input txt files by arrange smiles structure in first column and ID in second column.
	# Replace 'External-out.txt' with 'your_file_name.txt'.
		# Note : Avoid space between word !


echo " Extract SMILEs from *.txt file"
python - <<END
import os

data = []
fpath = os.getcwd()
fread = open(fpath + '/' + 'PAE.txt','r')

for i in fread:
	data.append(i)

smiles = []
molname = []
for i in data:
	a = i.rstrip().split()
	smiles.append(a[0])
	molname.append(a[1])

for i,j in zip(molname,smiles):
	fwrite = open(fpath + '/' + i + '.smi','w')
	fwrite.write(j)
	fwrite.close()	
END

##########################################################################################

# Convert .smi to 3D .mol file. implemented by molconvert application from ChemAxon Marvin Suite
	# Application path should be modified according to your application directory.
	# Note : Application directory depending on your operation system.
		# Path in this file is based on Mac OSX Yosemite.


echo "Convert .smi to 3D .mol file"
for i in *.smi; do j=`echo $i | sed 's/.smi/''/'`; echo $j 'is dearomatizing...'; /home/server1/ChemAxon/MarvinBeans/bin/molconvert smiles:-a $j.smi -o $j.smiles; done
