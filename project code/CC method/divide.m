% the funciton : divede time series  one to t(number) 
% X = [X1 X2 ...XN]
% X_d = { [X1 X(t+1) X(2t+1) ...]
%          [X2 X(t+2) X(2t+2) ...]
%              ...
%          [Xt X(2t) X(3t) ...] }

function X_d = divide(X,t)
% X:time series
% t:number
% X_d:the return of time series of dividing
    N = length(X);
    for i = 1:t
         for j=1:(N/t)
            X_d(i,j)=X(i+(j-1)*t);
         end

end

