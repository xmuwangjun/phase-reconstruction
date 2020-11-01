% calucate corrlation integral
% 1¡¢calucate each two vector max distance : d = max|x(i) - y(j)|£»
% 2¡¢compare r with r:tem = r -d
% 3¡¢Heaviside£¨tem£©
% 4¡¢: Cr = 1/N^2 ¦²(Heaviside£¨tem£©)

function Cr = CorrelationIntegral(Xr,r)
% Cr:corrlation integral
% Xr:reconstitution phase pace
% r

tem = size(Xr);
N = tem(2); %number of reconstitution phase pace
sum = 0;
for i = 1:N-1
    for j = i + 1:N
        d = norm((Xr(:,i)-Xr(:,j)),inf); %  Inf, return d = max(abs(v)).
        tem = r - d ;
        h_tem = heaviside(tem) ;
        sum = sum + h_tem;
    end
end
Cr = sum / (N*(N-1));
end