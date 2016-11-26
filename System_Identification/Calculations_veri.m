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

%% 
Co = ctrb(A,B);
rankCo = rank(Co);
Ob = obsv(A,C);
rankOb = rank(Ob);

sys = ss(A,B,C,D) ;
csys = canon(sys,'companion'); %% This Gives the Observable CF's

A_con=transpose(csys(1,1).A);
B_con=[0; 0; 0; 1];


% from the A_controllable, the bottom row is -> (-a0 -a1 -a2 -a3) 
% we can now use s^4 + 4s^3 + 6s^2 + 4s + 1
% s^4 + (a3+k4)s^3 + (a2+k3)s^2 + (a1+k2)s + (a0+k1)

syms K1 K2 K3 K4;
K1 = 4 + A_con(4,1) ;
K2 = 6 + A_con(4,2) ;
K3 = 4 + A_con(4,3) ;
K4 = 1 + A_con(4,4) ;
Kc = [K1 K2 K3 K4];

shit = B*Kc;
eig(A-B*Kc)
