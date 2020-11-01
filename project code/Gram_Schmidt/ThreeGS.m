%G-S正交化
function A = ThreeGS(V)  % V 为3*3向量
v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
a1 = zeros(3,1);
a2 = zeros(3,1);
a3 = zeros(3,1);
a1 = v1;
a2 = v2-((a1'*v2)/(a1'*a1))*a1;
a3 = v3-((a1'*v3)/(a1'*a1))*a1-((a2'*v3)/(a2'*a2))*a2;
A = [a1,a2,a3];
