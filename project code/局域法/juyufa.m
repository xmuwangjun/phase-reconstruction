X = [0.41 0.9767 0.1254 0.4387 0.9849 0.05921 0.2228 0.69271 0.85143 0.5059 0.9998 0.0005682 0.002271 0.009066 0.03593 0.1385 0.4775 0.9979];
T = 1:18;
N = length(X);
Xr=reconstitution_5_5(X,N,2,1)';
plot(Xr(:,1),Xr(:,2));
%%
D = [Xr(2,:); Xr(5,:); Xr(11,:);Xr(1,:); Xr(4,:);  Xr(10,:)]
x = D(:,1)
y = D(:,2)
p = polyfit(x,y,1) 

x1 = 0.4:0.01:1;
y1 = polyval(p,x1);
figure(1)
scatter(D(:,1),D(:,2))
hold on 
plot(x1,y1)
hold on 
Xp = polyval(p,X(18))
scatter(X(18),Xp)
    xlabel('x(n)');
    title('局域法');
ylabel('x(n+1)')
    legend('相关点','拟合直线','预测点');
    grid on;