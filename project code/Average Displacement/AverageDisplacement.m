% AverageDisplacement
% calculate average displacement
% the best 而 is when slop decrease the 40% of first

function [tao] = AverageDisplacement(X,max_tao,m)
% X : the time series
% max_tao : the max delay time
% m : embedde dimention

max_tao = max_tao + 1;
Sm = zeros(1,max_tao);

% calculate average displacement function Sm
for tao = 1:max_tao
    %     function Xr=reconstitution(X,m,tao)
    Xr = reconstitution(X,m,tao);
    
    temp = zeros(1,size(Xr,2));
    for i = 2:m
        temp = temp + (Xr(i,:) - Xr(1,:)).^2;
    end
    Sm(tao) = mean(sqrt(temp));  % average displacement funciton
end

% the best 而 is when slop decrease the 40% of first, the diff is slop 
slope = diff(Sm);                %the slope of tao and tao+1
compare = slope(1) * 0.4;

temp = find(slope<=compare);
tao = temp(1);

%plot Sm
figure('Name','Average Displacement','NumberTitle','off')
plot(1:length(Sm),Sm)
hold on;
xlabel('delay time 而');
ylabel('Average Displacement function');
title('Average Displacement');
hold on;
scatter(tao,Sm(tao));
text( tao+1,Sm(tao), ['而=' num2str(tao)] );

%plot slope
figure('Name','Average Displacement','NumberTitle','off')
plot(1:length(slope),slope);
hold on;
xlabel('delay time 而');
ylabel('Slope of Average Displacement function');
title('Slope of Average Displacement');
hold on;
scatter(tao,slope(tao));
text( tao+1,slope(tao), ['而=' num2str(tao)] );
plot(1:length(slope),slope);
end
