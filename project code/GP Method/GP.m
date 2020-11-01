% G-P method to get the m
% 1¡¢reconstitution phase pace
% 2¡¢gei teh max and min m

function [ln_r,ln_Cr,D_gp]=GP(X,tao,m_min,m_max,rs)
%  X : the time series
%  tao : delay time
%  m_max,m_min : max and min embedde dimention
%  rs : the step of r

Nx = length(X); %length of X
for m = m_min : m_max
    %  function X_r=reconstitution(X,m,tao)
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
    
    %when m is state , calculating the ln_Cr and ln_r
    
    for k = 1 : rs
        r = r_min + k * r_step;
        % calculate correlation integral for each r     function Cr=CorrelationIntegral(Xr,r)
        Cr(k) = CorrelationIntegral(Xr,r);
        ln_Cr(m,k) = log(Cr(k));
        ln_r(m,k) = log(r);
    end
end

% D_gp : Slope of ln(Cr)/ ln(r)
for i = m_min : m_max
p(i,:) = polyfit(ln_r(i,:),ln_Cr(i,:),1);    %Fitte srtaight line : ln(Cr) = p(1)* ln(r) + p(2)
D_gp(i) = p(i,1);
end

%plot log_Cr and log_r
figure('Name','G P','NumberTitle','off')
for i = m_min : m_max
    plot(ln_r(i,:),ln_Cr(i,:),'o-');
    text(0.95*ln_r(i,1),ln_Cr(i,1),0,num2str(i) )
    hold on;
end
xlabel('ln(r)');
ylabel('ln(Cr)');
title('G P');

%plot slop D_gp with m
figure('Name','D(GP) with m','NumberTitle','off')
plot(m_min : m_max,D_gp);
xlabel('m');
ylabel('D(GP)');
title('D(GP) with m');
grid on;
end
 

 