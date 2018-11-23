import pandas as pd
import numpy as np

if __name__ == '__main__':
    f = pd.read_csv('Results.csv')
    print(np.std(np.log(f.Area)))
