clear
zetad32 = 0.0133;
zetad12 = 0.1216;
Jm = 0.0162;
J3 = 0.0017;
k2 = 2.3888; % remember this was k3 before wrong naming
J1 = 0.0036;
k1 = 4.4339;
c1 = 0.0308;
c3 = 0.0017;
J2 = J3;
c2 = c3;
khw = 14.92;
Ds = [J1*J2 (c1*J2 + c2*J1) J1*(k1+k2)+J2*k1+c1*c2 c1*(k1+k2)+c2*k1 k1*k2];

TF1 = tf(khw.*[J2 c2 k1+k2],Ds);
TF2 = tf(khw.*[0 0 k1], Ds);
TF3 = tf([0 0 k1], [J2 c2 k1+k2]);
% 
% figure
% subplot(2,1,1)
% pzmap(TF1)
% grid on
% 
% subplot(2,1,2)
% pzmap(TF2)
% grid on
