import os
import sys
import pandas as pd
import numpy as np

command_list = ['Area', 'AR', 'Solidity', 'Circularity']

def usage_and_exit():
    print("Usage: {} command".format(sys.argv[0]))
    sys.exit(1)

def print_mean_and_std(files, field):
    if field == 'Circularity':
        field = 'Circ.'

    for dirname, f in files:
        print("  " + dirname + ":")
        print("    Mean: {}".format(np.mean(f[field])))
        print("    Standard Deviation: {}".format(np.std(f[field])))
        if field == 'Area':
            print("    Mean(Log): {}".format(np.mean(np.log(f[field]))))
            print("    Standard Deviation(Log): {}".format(np.std(np.log(f[field]))))

if len(sys.argv) == 1:
    usage_and_exit()

if not(sys.argv[1] in command_list + ['all']):
    print("Error: command must be one of 'Area', 'AR', 'Solidity', 'Circularity' or 'all'(got '{}').".format(sys.argv[1]))
    usage_and_exit()

files = []
for dirname in ["image1", "image2", "image3", "image4", "image5", "image6"]:
    path = "../assets/" + dirname + "/Results.csv"
    if os.path.isfile(path):
        files.append((dirname, pd.read_csv(path)))

if sys.argv[1] == 'all':
    for command in command_list:
        print(command)
        print_mean_and_std(files, command)
else:
    print(sys.argv[1])
    print_mean_and_std(files, sys.argv[1])
