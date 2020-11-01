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
tao_max = 100;
n = 100;
% function [tau I_sq]=mutual_information(data,tao_max,n)
[tao I_sq]=mutual_information(X,tao_max,n)
tao = tao 
%%
m= 3;
X_r=reconstitution(X,m,tao);
figure(2)
plot3(X_r(1,:),X_r(2,:),X_r(3,:));
title(['reconstruction m='  num2str(m) '  ¦Ó=' num2str(18)])
view(-12,19)
