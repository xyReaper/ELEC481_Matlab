
A = [0 1 0 0; -k1/J1 -c1/J1 k1/J1 0;0 0 0 1; k1/J2 0 (-k1-k2)/J2 -c2/J2;];

eA = eig(A);

syms s 
polyA = charpoly(A, s);
co = coeffs(polyA);
Ac = diag([1 1 1],1);
Ac(4,:) = -1*co(1:4);
co = fliplr(co);
r= roots (co);

B = [0; 1/J1; 0; 0;];
Bc =[0; 0; 0; 1;];
C = [1 0 0 0; 0 0 1 0];

Pc= zeros(4);

Pc(:,1) = Bc;
Pc(:,2) = Ac*Bc;
Pc(:,3) = Ac^2*Bc;
Pc(:,4) = Ac^3*Bc;

P = zeros(4);
P(:,1) = B;
P(:,2) = A*B;
P(:,3) = A^2*B;
P(:,4) = A^3*B;

T=P/Pc;
Cc = C*T;
