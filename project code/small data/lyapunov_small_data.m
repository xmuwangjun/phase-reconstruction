% small data sets method  for calculating the Lyapunov exponents of the time series

function [lya_max d y]= lyapunov_small_data(X,P,m,tao,delt_t)             
% P : average preiod
% X : time series
% m : embed dimension
% tao :delay time
% delt_t : sample period
% lya_max :max lyapunov

N=length(X);   % length of X
% function X_r=reconstitution(X,m,tao)
Xr = reconstitution(X,m,tao );
% number of reconstitution-phase
M=N-(m-1)*tao;
% d = zeros(M-1,M);

% caluclate d(i,j)
for j = 1:M
    d_min = 999999999;
    
    for j_temp = 1:M %search the min distance of each two point(space out>P) in reconstitution-phase
        if abs(j - j_temp) > P
            d_temp = norm(Xr(:,j)-Xr(:,j_temp));  % norm(v) returns the 2-norm or Euclidean norm of vector v
            %calculate distance 
            if d_temp < d_min
                d_min = d_temp;
                jj = j_temp;
            end           
        end
    end
    
    i_range = min((M-j),(M-jj)); %get the range of i

    for i = 1:i_range %calculate the distance of Xr(j) and Xr(jj) after discrete time(i)
       d(i,j) = norm(Xr(:,j+i)-Xr(:,jj+i));
    end
end

%for earch i ,calculate lnd(i) average y(i)
[d_i,d_j] = size(d);
y = zeros(1,d_i);
for i = 1 :d_i
    q = 0 ;%number of d(i,j) ~= 0
    y_temp = 0 ; %¦²£¨j = 1  to q£©ln(d(i,j))
    for j = 1 :d_j  % when i is state, calculate y(i)
        if d(i,j) ~= 0;
            q = q + 1 ; 
            y_temp = y_temp + log(d(i,j));
        end
    y(i) = y_temp / (q * delt_t);
    end
end

% max lyapunov : slop of y
x = 1:length(y);
p = polyfit(x,y,1);
lya_max = p(1);
y_p = polyval(p,x);

figure('Name','Small Data Sets Method')
plot(x,y,'.-')
hold on ;
% plot(x,y_p,'-');
ylabel('y(i)');
 title({['Small Data Sets Method '];['m = ',num2str(m),'   ¦Ó = ',num2str(tao),'   ¡÷t = ',num2str(0.001)]});
% % slope = num2str(lya_max)
% legend('y(i)',['y(fitting) slope = ' num2str(lya_max)],'Location','northwest');
grid on;
end
