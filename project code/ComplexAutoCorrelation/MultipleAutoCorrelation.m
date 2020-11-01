% MultipleautoCorrelation method to calculate delay time(而)
% 1﹜calculate MultipleautoCorrelation function
% 2﹜the best 而 is autocorr decrease 1 - 1/e initial value

function [tao] = MultipleAutoCorrelation(X,tao_max,m)
% X : time series
% tao_max ㄩmax de;ay time


X_mean = mean(abs(X)); % X average value

C_xx = zeros(1,tao_max); %C_xx :MultipleautoCorrelation funciton

% reconstitute then calculate C_xx
for tao_i = 1:tao_max
%     function X_r=reconstitution(X,m,tao)
    Xr = reconstitution(X,m,tao_i);     
    Xr_cols = size(Xr,2);
    tem = zeros(1,Xr_cols);
    
    for i = 2:m
        tem = tem + (Xr(1,:)-X_mean) .* (Xr(i,:)-X_mean);
    end
    C_xx(tao_i) = mean(tem);  
end

% the best 而 is autocorr decrease 1 - 1/e initial value
compare = (1-exp(-1))*C_xx(1);
tem = find(C_xx<=compare);
tao = tem(1);

% plot
figure('Name','MultipleAutoCorrelation','NumberTitle','off')
plot(C_xx)
xlabel('delay time 而');
ylabel('Multiple-autocorrelation function');
title('Multiple autocorrelation');
hold on
scatter(tem(1),C_xx(tem(1)));
text( tem(1)+1,C_xx(tem(1)), ['而=' num2str(tem(1))] );
end


