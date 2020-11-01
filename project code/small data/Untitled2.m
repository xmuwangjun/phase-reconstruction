%Lorenz£¬rung£¨funciton£¬¡¾ragne¡¿£¬¡¾initial¡¿£¬accurancy£©  
clc 
clear

a=0;
b=50;
c=[0 2 9];
h=0.01;
[t,y]=rung(@lorenz,[a b],c,h);
%%
a_ = 0;
b_ = 50;
[t,x]=rung(@lorenz,[a_ b_],y(:,end),h);
%%
X = x(1,:);
m = 6;
tao = 18;
P = 60;
% function [lya_max d y]= lyapunov_small_data(X,P,m,tao,delt_t)  
[lya_max d y]= lyapunov_small_data(X,P,m,tao,0.01) ;
% lya_max 
%%
% % y_line = y(1:190)
% y_d = diff(y);
% figure(2)
% plot(y_d);
% %%
% tem = y(50:120);
% figure (3)
% plot(tem)