function dX = Lorenz_ly(t,X)
%  Lorenz吸引子，用来计算Lyapunov指数
%        
%        dx/dt = 10*(-x+y),
%        dy/dt = 28*x-y-x*z,
%        dz/dt = x*y-8/3*z,
x=X(1); y=X(2); z=X(3);
% Y的三个列向量为相互正交的单位向量
Y = [X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];
% 输出向量的初始化，必不可少
dX = zeros(12,1);
% Lorenz吸引子
dX(1) = 10*(-x+y);
dX(2) = 28*x-y-x*z;
dX(3) = x*y-8/3*z;
% Lorenz吸引子的Jacobi矩阵
Jaco = [-10 10 0;
        28-z -1 -x;
        y x  -8/3];
dX(4:12) = Jaco*Y;