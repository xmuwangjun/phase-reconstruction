% Autocorrelation method to calculate delay time(而)
% 1﹜calculate autocorrlation function
% 2﹜the best 而 is autocorr decrease 1 - 1/e initial value


function [tao] = autoCorrelation(X,tao_max)
%  X : time seires
% tao_max ㄩ max delay time

ACF = autocorr(X,tao_max);   % calculate autocorrolation function LACF
ACF = ACF(2:end);            % the firs ACF is tao=0 , remove it  

% autocorrlation function decrease 1-1/e of intial value
compare = (1-exp(-1))*ACF(1);
% find first zero point
tem = find(ACF<=compare);


if (isempty(tem))
    disp('err: max delay time is too small!')
    tao = [];
else
    tao = tem(1);
end


figure('Name','Autocorrelation','NumberTitle','off')
plot(1:length(ACF),ACF)
xlabel('delay time 而');
ylabel('autocorrelation function');
title('autocorrelation');
hold on;
scatter(tem(1),ACF(tem(1)));
text( tem(1)+1,ACF(tem(1)), ['而=' num2str(tem(1))] );
end
