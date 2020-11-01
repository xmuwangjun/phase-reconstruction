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
N = length(X);
% function [ln_r,ln_C]=GP(X,tao,m_min,m_max,rs)
[ln_r,ln_C] =GP(X,10,1,10,10);
%%
lnC = ln_C(:,1:2);
lnr = ln_r(:,1:2);
for i=1:10
p(i,:) = polyfit(lnr(i,:),lnC(i,:),1);    %Fitte srtaight line : ln(Cr) = p(1)* ln(r) + p(2)
D_gp(i) = p(i,1);
end
%%
 slop = ln_C(:,4) - ln_C(:,1)
