import numpy as np
from mapper import is_prime
from numba import njit

#The class loads 3D data, calculates the scale and center, and creates an array of flags to indicate whether the indices in the data correspond to prime numbers.
class DataLoader:
    def __init__(self, data_path='data/map_data_3d_1000000_15_02.npy'):
        #
        self.point_positions = np.load(data_path)
        #
        self.scale = np.max(self.point_positions)
        self.center = np.mean(self.point_positions, axis=0)
        #
        size = len(self.point_positions)
        #
        self.prime_flags = np.empty((size, 1), dtype='int8')
        self.update_prime_flags(size, self.prime_flags)

    @staticmethod
    @njit(cache=True)
    def update_prime_flags(size, prime_flags):
        for n in range(size):
            prime_flags[n] = is_prime(n)
