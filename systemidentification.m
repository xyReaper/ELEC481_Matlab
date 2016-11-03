%System identification
%author Rami Kandela
% 2016-10-28
clear;

%Loaded 4 masses on upper and lower disk with center disk clamped
%naming is as follows txy_z  x is the disk 3 being upper y is the trial
%number and z is the interval (upper minus lower)


%% 


%Upper disk calculations
t31_2= 3.52;
t31_1= 0.255;
cycles = 6;
T31= (t31_2-t31_1)/cycles;
f31=1/T31;
wnd31=2*pi*f31;

%Removed 4 masses from upper disk 
%to repeat same experiment
t32_1= 0.024;
t32_2= 1.035;
cycles = 6;
T32= (t32_2-t32_1)/cycles;
f32=1/T32;
wnd32=2*pi*f32;

%step 9
% X is the amplitude
X0 = 478; %amplitude of t32_1
X6 = 290; %amplitude of t32_2
zetad32 = 1/(2*pi*cycles) * log(X0/X6);
%End of upper disk calcs
%% 
%Lower Disk Calcs
t11_2= 2.3;
t11_1= 0.2;
cycles_2 = 5;
T11= (t11_2-t11_1)/cycles_2;
f11=1/T11;
wnd11=2*pi*f11;

% no mass

t12_2= 0.6;
t12_1= 0.062;
cycles_3 = 3;
T12= (t12_2-t12_1)/cycles_3;
f12=1/T12;
wnd12=2*pi*f12;

%step 9
% X is the amplitude

X0 = 485; %amplitude of t32_1
X3 = 49; %amplitude of t32_2

zetad12 = 1/(2*pi*cycles_3) * log(X0/X3);

mass = 0.5;
Jm = (mass*4)*(0.09)^2;

syms kd3 J3;

eq1 = kd3/(Jm+J3) ==(wnd31)^2;
eq2 = kd3/J3 == (wnd32)^2;

sol = vpasolve([eq1, eq2], [kd3, J3]);

J3 = sol.J3;
kd3= sol.kd3;


