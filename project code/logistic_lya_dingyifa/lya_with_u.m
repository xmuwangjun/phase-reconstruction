% lya = logistic_ly(a,u,n),【初值，参数u,迭代次数】
lya=[];
%u从1增加到4，步长0.001
u = 1:0.001:4;
 for i= 1:length(u);
     lya(i) = logistic_ly(0.1,u(i),5000);
 end
 %%
 figure()
 plot(u,lya);
 hold on;
axis([2.92 4 -5 inf])
 plot([1 4],[0 0])
    xlabel('u');
    ylabel('lyapunov exponet');
    title('logistic lyapunov exponet');