% 关联积分计算函数
% 1、计算所有两点之间的距离，取无穷范数，得出矢量的最大距离 d = max|x(i) - y(j)|；
% 2、距离 d 与给定的关联矢量 r 做差tem = r -d 
% 3、单位函数 Heaviside（tem）
% 4、关联积分 Cr = 1/N^2 Σ(Heaviside（tem）)

function Cr = CorrelationIntegral(Xr,r)
% Cr 关联积分
% Xr 重构相空间
% r 有关联的矢量

tem = size(Xr); 
N = tem(2); %重构空间中的点数
sum = 0;
for i = 1:N-1
    for j = i + 1:N
        d = norm((Xr(:,i)-Xr(:,j)),inf); %计算重构空间中的每两点距离，取无穷范数
        tem = r - d ;
        h_tem = heaviside(tem) ;
        sum = sum + h_tem;
    end
end
Cr=2*sum/(N*(N-1));
end
