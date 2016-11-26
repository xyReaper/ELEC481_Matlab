%% 
clear;
run Values_of_system.m;
A = [0 1 0 0; 
    -k1/J1 -c1/J1 k1/J1 0;
    0 0 0 1; 
    k1/J2 0 (-k1-k2)/J2 -c2/J2;];
B = [0; 1/J1; 0; 0;];
C = eye(4);
D = [0;0;0;0;];

eA = eig(A);

syms s 
polyA = charpoly(A, s);
co = coeffs(polyA);
Ac = diag([1 1 1],1);
Ac(4,:) = -1*co(1:4);
co = fliplr(co);
r= roots (co);

Bc =[0; 0; 0; 1;];

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

a3 = Ac(4,4); 
a2 = Ac(4,3);
a1 = Ac(4,2);
a0 = Ac(4,1);

k4 = 4 + a3;
k3 = 6 + a2;
k2 = 4 + a1;
k1 = 1 + a0;
kc = [k1 k2 k3 k4];

T = P/Pc;
%k = vpa(kc*T,4);
%kc=kT
%Ax=b
%x = A\b
% k = kc\T;
k = kc / T;
eig(A-B*k)




