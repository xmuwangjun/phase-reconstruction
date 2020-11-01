% mutual information : calculate τ

function [tao I_sq]=mutual_information(X,tao_max,n)
% X：time series
% tao_max：max τ
% n：等间隔小格子划分数

I_sq=zeros(tao_max,1);
N=length(X);

for tao=1:tao_max
    %according to τ，let x to s and q
    s=X(1:N-tao);q=X(tao+1:N);
    %划分格子
    as=min(s);bq=min(q);
    delt_s = (max(s)-min(s))/n;
    delt_q = (max(q)-min(q))/n;
    N_sq = zeros(n);
    
    for ii=1:n
        %计算位于格子(ii,jj)内的相点个数
        for jj = 1:n
            for k = 1:N-tao
                as_k = (s(k)-as)/delt_s;
                bq_k = (q(k)-bq)/delt_q;
                if as_k>= ii-1 & as_k < ii & bq_k >= jj-1 & bq_k < jj
                    N_sq(ii,jj) = N_sq(ii,jj)+1;
                end
            end
        end
    end
    Ntotal = sum(sum(N_sq));
    %计算位于一维s格子内的概率
    Ps = sum(N_sq)/Ntotal;
    %计算位于一维q格子内的概率
    Pq = sum(N_sq')/Ntotal;
    %计算位于二维格子(ii,jj)内概率
    Psq = N_sq/Ntotal;
    
    %计算s的熵
    H_s = 0;
    %计算q的熵
    H_q = 0;
    
    for i = 1:n
        if Ps(i)~= 0
            H_s = H_s - Ps(i)*log(Ps(i));
        elseif Pq(i)~=0
            H_q = H_q - Pq(i)*log(Pq(i));
        end
    end
    
    %计算(s,q)的联合熵
    H_sq = 0;
    for i = 1:n
        for j = 1:n
            if Psq(i,j)~= 0
                H_sq = H_sq-Psq(i,j)*log(Psq(i,j));
            end
        end
    end
    
    %计算tau下的互信息函数
    I_sq(tao)=H_s+H_q-H_sq;
    
    clear s q;
    
end
for i = 1:length(I_sq)-1
    if (I_sq(i) <= I_sq(i+1))
        tao = i;        % 第一个局部极小值位置
        break;
    end
end
    %plot slope
    figure('Name','Mutual Information','NumberTitle','off')
    plot(1:length(I_sq),I_sq);
    hold on;
    xlabel('delay time τ');
    ylabel('Mutual Information function');
    title('Mutual Information');
    hold on;
    scatter(tao,I_sq(tao));
    text( tao+1,I_sq(tao), ['τ=' num2str(tao)] );
    plot(1:length(I_sq),I_sq);
end
