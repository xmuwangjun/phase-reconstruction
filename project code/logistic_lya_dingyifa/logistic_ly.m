function logis_lya = logistic_ly(a,u,n)
%function x = Logistic(x,u):初值，系数u，迭代次数n
%迭代1000次达到稳态，
temp = Logistic(a,u,1000);
a = Logistic(temp(1000),u,5000);

diff_value=[];
diff_value_ln=[];
  for i = 1 : n
    diff_value(i) = u - 2 * u * a(i);%计算当前导数值
    diff_value_ln(i) = log(abs(diff_value(i)));%取自然对数
  end
% 利用subs计算，需要更换数据类型，计算速度慢
%     for i = 1 : 5000
%     diff_value(i) = subs(diff_logis,x,a(i));%计算当前导数值
%     diff_value_ln(i) = log(abs(diff_value(i)));%取自然对数
%  end

logis_lya = sum(diff_value_ln) / n;
end
