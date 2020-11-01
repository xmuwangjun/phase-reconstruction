function dX = Rossler_ly(t,X)
%  Rossler吸引子，用来计算Lyapunov指数
%        a=0.15,b=0.20,c=10.0
%        dx/dt = -y-z,
%        dy/dt = x+ay,
%        dz/dt = b+z(x-c),
a = 0.15;
b = 0.20;
c = 10.0;
x=X(1); y=X(2); z=X(3);
% Y的三个列向量为相互正交的单位向量
Y = [X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];
% 输出向量的初始化，必不可少
dX = zeros(12,1);
% Rossler吸引子
dX(1) = -y-z;
dX(2) = x+a*y;
dX(3) = b+z*(x-c);
% Rossler吸引子的Jacobi矩阵
Jaco = [0 -1 -1;
        1 a  0;
        z 0  x-c];
dX(4:12) = Jaco*Y;