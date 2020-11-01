% 计算Lorenz吸引子的Lyapunov指数
clear;
yinit = [1,1,1];
orthmatrix = [1 0 0;
              0 1 0;
              0 0 1];
          
y = zeros(12,1);
% 初始化输入
y(1:3) = yinit;
y(4:12) = orthmatrix;
tstart = 0; % 时间初始值
tstep = 1e-2; % 时间步长
wholetimes = 1e6; % 总的循环次数
steps = 10; % 每次演化的步数
iteratetimes = wholetimes/steps; % 演化的次数
mod = zeros(3,1);
lp = zeros(3,1);
% 初始化三个Lyapunov指数
Lyapunov1 = zeros(iteratetimes,1);
Lyapunov2 = zeros(iteratetimes,1);
Lyapunov3 = zeros(iteratetimes,1);

%%
for i=1:iteratetimes
    tspan = tstart:tstep:(tstart + tstep*steps);   
    [T,Y] = ode45('Lorenz_ly', tspan, y);
    % 取积分得到的最后一个时刻的值
    y = Y(size(Y,1),:);
    % 重新定义起始时刻
    tstart = tstart + tstep*steps;
    y0 = [y(4) y(7) y(10);
          y(5) y(8) y(11);
          y(6) y(9) y(12)];
    %正交化
    y0 = ThreeGS(y0);
    % 取三个向量的模
    mod(1) = sqrt(y0(:,1)'*y0(:,1));
    mod(2) = sqrt(y0(:,2)'*y0(:,2));
    mod(3) = sqrt(y0(:,3)'*y0(:,3));
    y0(:,1) = y0(:,1)/mod(1);
    y0(:,2) = y0(:,2)/mod(2);
    y0(:,3) = y0(:,3)/mod(3);
    lp = lp+log(abs(mod));
    %三个Lyapunov指数
    Lyapunov1(i) = lp(1)/(tstart);
    Lyapunov2(i) = lp(2)/(tstart);
    Lyapunov3(i) = lp(3)/(tstart);
        y(4:12) = y0';
end

%%
% 作Lyapunov指数谱图
i = 1:iteratetimes;
plot(i,Lyapunov1,i,Lyapunov2,i,Lyapunov3)