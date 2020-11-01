from DataDisplayUI import Ui_MainWindow
from PyQt5.QtWidgets import QApplication,QMainWindow,QGridLayout
from PyQt5.QtCore import QTimer
import sys,time
import numpy as np

from mpl_toolkits.mplot3d import Axes3D
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

import matplotlib
from scipy.integrate import odeint


class Figure_Canvas(FigureCanvas):
    def __init__(self,parent=None,width=3.9,height=2.7,dpi=100):
        self.fig=Figure(figsize=(width,height),dpi=100)
        super(Figure_Canvas,self).__init__(self.fig)
        self.ax=self.fig.add_subplot(111)

        
class ImgDisp(QMainWindow,Ui_MainWindow):
    def __init__(self,parent=None):
        super(ImgDisp,self).__init__(parent)
        self.setupUi(self)
        self.Init_Widgets()
        # self.slider

    def Init_Widgets(self):
        self.SurfFigure = Figure_Canvas()
        self.SurfFigureLayout = QGridLayout(self.groupBox_2)
        self.SurfFigureLayout.addWidget(self.SurfFigure)
        self.SurfFigure.ax.remove()
        self.ax3d = self.SurfFigure.fig.gca(projection='3d')
        self.SurfFigure1 = Figure_Canvas()
        self.SurfFigureLayout1 = QGridLayout(self.groupBox)
        self.SurfFigureLayout1.addWidget(self.SurfFigure1)
        self.SurfFigure1.ax.remove()
        self.ax3d1 = self.SurfFigure1.fig.gca(projection='3d')

        self.PrepareLorenz()
        self.PrepareRecons()
        self.SliderChange()

    def lorenz(self,s,t):
        sigma = 10
        rho = 28
        beta = 3
        x, y, z = s
        return np.array([sigma * (y - x), x * (rho - z), x * y - beta * z])
        
    def recons(self,X,m,tao):
        N = X.size
        M = N - (m - 1) * tao
        Xr = np.zeros( (m, M-1) )
        for j in range(M-1):
            for i in range(m):
                Xr[i,j] = X[ (i-1) * tao + j]
        return Xr

    def PrepareLorenz(self):
        a = int(1e4)
        b = int(2e4)
        s0 = (0., 1., 0.)
        t = np.arange(0, 210, 0.01)
        s = odeint(self.lorenz, s0, t).T


        self.ax3d1.cla()
        self.Surf1 = self.ax3d1.plot(s[0,a:b], s[1,a:b], s[2,a:b], lw=0.5 )
        self.SurfFigure1.draw()


    def SliderChange(self):
        self.slide = self.horizontalSlider
        self.slide.setRange(1,50)
        self.slide.valueChanged.connect(lambda: self.on_change_func(self.slide))

    def PrepareRecons(self,tao=1):
        a = int(1e4)
        b = int(2e4)
        s0 = (0., 1., 0.)
        t = np.arange(0, 210, 0.01)
        s = odeint(self.lorenz, s0, t).T
        X, m, tao = s[0,:], 3, tao
        sr = self.recons(X, m, tao)
        self.ax3d.cla()
        self.Surf = self.ax3d.plot(sr[0,a:b], sr[1,a:b], sr[2,a:b], lw=0.5 )
        self.SurfFigure.draw()


    def on_change_func(self, slider):      
        self.label = self.textBrowser
        self.label.setText(str(self.slide.value()))
        self.tao = self.slide.value()
        # self.SurfFigure.remove()
        self.PrepareRecons(self.tao)


if __name__=='__main__':
    app=QApplication(sys.argv)
    ui=ImgDisp()
    ui.show()
    sys.exit(app.exec_())
