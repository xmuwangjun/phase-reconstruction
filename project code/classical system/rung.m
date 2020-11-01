%ËÄ½×Áú¸ç¿âËþ·¨
function [x,y]=rung(f,t,y0,h)
x=t(1):h:t(2);
y=zeros(length(y0),length(x));
y(:,1)=y0(:);
for i=1:(length(x)-1)
    k1=f(x(i),y(:,i));
    k2=f(x(i)+h/2,y(:,i)+h/2*k1);
    k3=f(x(i)+h/2,y(:,i)+h/2*k2);
    k4=f(x(i)+h,y(:,i)+h*k1);
    y(:,i+1)=y(:,i)+h/6*(k1+2*k2+2*k3+k4);
  
end