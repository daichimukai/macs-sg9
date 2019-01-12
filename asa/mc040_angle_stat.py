#!/usr/bin/env python

import pandas as pd
import numpy as np
import sys

################
### input files
################
f000 = "./result030_stats_bladder5.csv"


################
### output settings
################
outnames = ["result040_angle_bladder5.csv"]


################
### analyze angles
################
df = pd.read_csv(f000)
df = df.iloc[:, [0, 1, 2, 3, 4, 5, 6, 7, 20, 21, 22]]
#print(df.iloc[0:10, :]); sys.exit()

from angle_to_xaxis import angle
df = pd.concat(
    [df, pd.DataFrame(angle(np.array(df.iloc[:, 4:6])), columns = ["radian_base_to_x", "degree_base_to_x"])],
    axis = 1
).ix[:, [0, 1, 2, 3, 4, 5, 11, 12, 6, 7, 8, 9, 10]]
#print(df.iloc[0:10, :]); sys.exit()
#print(df.shape); sys.exit()

### calculate angles to base
df = pd.concat([df, pd.DataFrame(np.zeros((df.shape[0], 1)), columns = ["angle_to_base"])], axis = 1)
for j in range(0, df.shape[0]):
    df.iloc[j, 13] = abs(df.iloc[j, 12] - df.iloc[j, 7])
    #
    #
#print(df.iloc[0:10, :]); sys.exit()


################
### save, graphs on R
################
df.to_csv(outnames[0], index = False)


################
###
################


###
