% calculate Correlation_Dimension
%   1¡¢reconstitution X to Xr
%   2¡¢calculate the r : between the max and min distance of all point
%   3¡¢calculate CorrelationIntegral with r
%
function [D_gp ln_r ln_Cr] = Correlation_Dimension(X,m,tao,rs)
Nx = length(X);
%  function Xr=reconstitution(X,m,tao)
Xr = reconstitution(X,m,tao);
%calculate the range of r
Mxr = Nx - (m - 1) * tao; %Mxr : number of all points in Xr
for i = 1: Mxr - 1
    for j = i + 1:Mxr
        d1(i,j) = norm((Xr(:,i)-Xr(:,j)),inf); %calculate the distance of every two points
        d(i,j)=max(abs(Xr(:,i)-Xr(:,j)));
    end
end

r_max = max(max(d));
r_min = min(min(d));
r_step = (r_max - r_min) / rs;

%calculating the ln_Cr and ln_r
for i = 1 : rs
    r = r_min + i * r_step;
    % calculate correlation integral for each r     function Cr=CorrelationIntegral(Xr,r)
    Cr(i) = CorrelationIntegral(Xr,r);
    ln_Cr(i) = log(Cr(i));
    ln_r(i) = log(r);
    
end

% D_gp : Slope of ln(Cr)/ ln(r)
p = polyfit(ln_r,ln_Cr,1);    %Fitte srtaight line : ln(Cr) = p(1)* ln(r) + p(2)
y1 = polyval(p,ln_r);         % Calculate polynomial-p 
D_gp = p(1)

figure('Name','Correlation dimension')
plot(ln_r,ln_Cr,'o-')
hold on ;
plot(ln_r,y1);
xlabel('ln(r)');
ylabel('ln(Cr)');
title({['Correlation dimension '];['m = ',num2str(m),'   ¦Ó = ',num2str(tao)]});
slope = num2str(D_gp)
legend('ln(Cr)/ln(r)',['D_g_p = ' num2str(D_gp)],'Location','northwest');
grid on;
end

