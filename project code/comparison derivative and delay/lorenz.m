function dydt=lorenz(t,y)
dydt=[10*(-y(1)+y(2));
      28*y(1)-y(2)-y(1)*y(3);
      y(1)*y(2)-8*y(3)/3;];
  