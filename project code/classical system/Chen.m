function dydt=Chen(t,y)
dydt=[35 * (y(2) - y(1));
     -7 * y(1) - y(1) * y(3) + 28 * y(2);
     y(1) * y(2) - 3 * y(3); ] ;