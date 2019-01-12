#!/usr/bin/env python

import pandas as pd
import numpy as np

################
### input files
################
m000 = "./bladder5_measure.csv"
b000 = "./bladder_basement5.txt"

### measure
mdf = pd.read_csv(m000)
mdf = mdf.rename(columns = {" " : "Cell_Index"})
#print(np.array(mdf.iloc[:, [0, 7, 8]])[0:10, :])

### base
bdf = np.loadtxt(b000, delimiter = "\t")
print(bdf[0:10, 0:2])


################
### output settings
################
outnames = ["result020_baselabeled_bladder5.csv"]


################
### classification along basement membrane
################
from classification import classifier

df = classifier(bdf, np.array(mdf.iloc[:, [0, 7, 8]]))

df = pd.DataFrame(df, columns = ["Cell_Index", "X", "Y", "Base_ID", "Base_dx", "Base_dy", "length_to_base"])
df.to_csv(outnames[0], index = False)


################
###
################


################
###
################


###
