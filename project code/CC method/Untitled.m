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
b_ = 5;
[t,x]=rung(@lorenz,[a_ b_],y(:,end),h);
%%
X = x(1,:);
tao_max = 100;
% function [tao,tw,m_S,m_d_S,Scor]=C_C(X,tao_max)
 [tao,tw,m_S,m_d_S,Scor] = C_C(X,tao_max);
 tao = tao
 tw =tw 


