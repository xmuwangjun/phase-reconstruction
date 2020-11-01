clc
clear
%Lorenz£¬rung£¨funciton£¬¡¾ragne¡¿£¬¡¾initial¡¿£¬accurancy£©  
a=0;
b=50;
c=[0 2 9];
h=0.01;
[t,y]=rung(@lorenz,[a b],c,h);%transient data
%%
a_ = 0;
b_ = 50;
[t,x]=rung(@lorenz,[a_ b_],y(:,end)',h);
%%
% function [D_gp ln_r ln_Cr] = Correlation_Dimension(X,m,tao,rs)
m = 8;
tao = 10;
rs = 20;
[D_gp1 ln_r1 ln_Cr1] = Correlation_Dimension(x(1,:),m,tao,rs);
[D_gp2 ln_r2 ln_Cr2] = Correlation_Dimension(x(2,:),m,tao,rs);
[D_gp3 ln_r3 ln_Cr3] = Correlation_Dimension(x(3,:),m,tao,rs);

%%
figure('Name','Correlation dimension')
plot(ln_r1,ln_Cr1,'o-')
hold on ;
plot(ln_r2,ln_Cr2,'o-')
hold on;
plot(ln_r3,ln_Cr3,'o-')
xlabel('ln(r)');
ylabel('ln(Cr)');
title({['Correlation dimension '];['m = ',num2str(m),'   ¦Ó = ',num2str(tao)]});
legend('x','y','z','Location','northwest');
grid on;