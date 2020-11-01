% CC : search delay time
function [tao,tw,m_S,m_d_S,Scor]=C_C(X,tao_max)

    % X : time series
    % tao_max :max delay time

    % tao : best delay time
    % tw : time window
    % m_S : average S(m,r,t)
    % m_d_S : average ¦¤S£¨m,t£©
    % Scor : Scor(t)


    N = length(X); % length of X
    X_se = std(X); % standard deviation of X

for t = 1:tao_max
    S = zeros(4,4);
    Sdelt = zeros(1,4);
    for m = 2:5
        %calculate the S of each r
        for i = 1:4
            r = X_se/2 * i ;  % r step is X_se/2
            X_d = divide(X,t);
            
            % calculate the Cs_m and Cs_1 for every deviation
            s_temp = 0; % s_temp : calculate the sum of S(m,r,t)
            for tao = 1:t
                X_d_temp = X_d(tao,:);
                %                 function Cr = CorrelationIntegral(Xr,r)
                Cs_1(tao) = CorrelationIntegral(X_d_temp,r);% Cs_1 : Cs(m,N/t,r,t)
                %                 function X_r=reconstitution(X,m,tao) phase space reconstition
                X_r = reconstitution(X_d_temp,m,1);
                Cs_m(tao) = CorrelationIntegral(X_r,r); % Cs_m : C(m,N/t,r,t)
                s_temp = s_temp+(Cs_m(tao)-Cs_1(tao)^m);
            end
            
            S(m-1,i) = s_temp / tao;          %S : S(m,r,t)
        end
        
        d_S(m-1) = max(S(m-1,:)) - min(S(m-1,:));          % d_S : ¦¤S£¨m,t£©
    end
m_S(t) = mean(mean(S));                              % m_S : average S(m,r,t)
m_d_S(t) = mean(d_S);                                % m_d_S : average ¦¤S£¨m,t£©
Scor(t) = abs(m_S(t))+ m_d_S(t);                      %Scor : Scor(t)
end

% serach tao(delay time£©: t when first minimum of average ¦¤S£¨m,t£©
for i = 1:length(m_d_S) 
    temp(i) = -m_d_S(i);%reverse then findpeaks(find all max vaule) ,the results of findpeaks(temp) is all min value
end
    [pks,locs] = findpeaks(temp) ;
tao = locs(1);

% search time window(tw) : minimum of  Scor(t)
for i=1:length(Scor)
    if Scor(i) == min(Scor)
        tw=i;
        break;
    end
end
    figure('Name','C - C','NumberTitle','off')
    xlabel('delay time ¦Ó');
    title('C - C');
    plot(1:tao_max,m_S,'-or');
    hold on;
    plot(1:tao_max,m_d_S,'-*g');
    hold on;
    plot(1:tao_max,Scor,'-+b');
    legend('S(m,r,t)','¦¤S£¨m,t£©','Scor');
    title('C - C')
end


