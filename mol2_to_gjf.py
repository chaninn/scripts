import os
import glob
import openbabel
from pybel import *

path = os.getcwd()+'/'
out = glob.glob(path+'*.mol2')

outlist = []

for i in out:
    out_name_ext = i.split('/')
    out_file_name, out_file_extension = out_name_ext[-1].split('.')
    outlist.append(out_file_name)

for i in range(len(outlist)):
        conv = openbabel.OBConversion()
        conv.SetInAndOutFormats("mol2", "gjf")
        conv.SetOptions("b", conv.OUTOPTIONS)

        mol = openbabel.OBMol()
        conv.ReadFile(mol, path + "/" + outlist[i] + ".mol2")
        conv.WriteFile(mol, path + "/" + outlist[i] + ".gjf")
