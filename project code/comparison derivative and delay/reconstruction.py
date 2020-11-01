import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d as Axes3D

def lorenz(s, t):
    sigma = 10
    rho = 28
    beta = 3
    x, y, z = s
    return np.array([sigma * (y - x), x * (rho - z), x * y - beta * z])

def recons(X, m, tao):
    
    N = X.size
    M = N - (m - 1) * tao

    Xr = np.zeros( (m, M-1) )

    for j in range(M-1):
        for i in range(m):
            temp = (i-1) * tao + j
            Xr[i,j] = X[ (i-1) * tao + j]
    return Xr


if __name__ == "__main__":
    

    # range
    a = int(1e4)
    b = int(2e4)

    # plot lorenz
    s0 = (0., 1., 0.)
    t = np.arange(0, 210, 0.01)
    s = odeint(lorenz, s0, t).T

    fig = plt.figure(1)
    ax = fig.add_subplot(111, projection = '3d')
    ax.plot(s[0,a:b], s[1,a:b], s[2,a:b], lw=0.5 )
    ax.view_init(elev = -155, azim = -50)
    # plt.show()
    
    
    # recobstuction
    X, m, tao = s[0,:], 3, 3

    sr = recons(X, m, tao)
    fig = plt.figure(2)
    ax = fig.add_subplot(111, projection = '3d')
    ax.plot(sr[0,a:b], sr[1,a:b], sr[2,a:b], lw=0.5 )
    ax.view_init(elev = -169, azim = 133)
    plt.show()
