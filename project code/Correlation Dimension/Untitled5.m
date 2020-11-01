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
b_ = 10;
[t,x]=rung(@lorenz,[a_ b_],y(:,end)',h);
%%
% function [D_gp ln_r ln_Cr] = Correlation_Dimension(X,m,tao,rs)
X = x(1,:);
m = 8;
tao = 10;
rs = 10;
[D_gp ln_r ln_Cr] = Correlation_Dimension(X,m,tao,rs);

