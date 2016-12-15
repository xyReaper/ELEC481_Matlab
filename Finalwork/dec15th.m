%% 
%something new

voltage = ones(1,1150)*0.85;
voltage = voltage';
time=data(1:1150,2);
com_pos=data(1:1150,3);
theta1=data(1:1150,4);
theta2=data(1:1150,5);

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

plant = iddata([theta1,theta1dot,theta2,theta2dot],voltage,0.009);
plant.InputName = {'Command pos'};
plant.OutputName = {'Theta 1','Theta 1 dot','Theta 2','Theta 2 dot'};
% 
% figure 
% plot(plant(:,1,1))
% figure
% plot(plant(:,2,1))
k = [1.0074,4.9957,-0.07867,5.27106];
mp= ssest(plant,4);

A = double(mp.A);
B = double(mp.B);
C = double(mp.C);
D = double(mp.D);
%% 



