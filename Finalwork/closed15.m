
time=closed(1:450,2);
com_pos=closed(1:450,3);
theta1=closed(1:450,4);
theta2=closed(1:450,5);

theta_delta1=diff(theta1);
theta_delta2=diff(theta2);
time_delta=diff(time);
theta1dott= theta_delta1/mean(time_delta);
theta2dott= theta_delta2/mean(time_delta);

theta1dot=[0; theta1dott];
theta2dot=[0; theta2dott];
clear theta1dott theta2dott
% figure
% plot(time,com_pos,time,theta1,time,theta2);

plant = iddata([theta1,theta1dot,theta2,theta2dot],com_pos,0.009);
plant.InputName = {'Command pos'};
plant.OutputName = {'Theta 1','Theta 1 dot','Theta 2','Theta 2 dot'};
% 
% figure 
% plot(plant(:,1,1))
% figure
% plot(plant(:,2,1))
k = [1.0074,4.9957,-0.07867,5.27106];
mp= ssest(plant,4);
kpf=0.935;
Af = double(mp.A);
Bf = double(mp.B);
Cf = double(mp.C);
Df = double(mp.D);

B=Bf/kpf;
A= Af + B*k;
C=Cf;
D = Df;



roots_Ce = [-3 -4 50 100];
syms x zeta wn
poly_Ce_coef= expand(prod(x-roots_Ce));
Ccoef_poly = double(coeffs(poly_Ce_coef));
