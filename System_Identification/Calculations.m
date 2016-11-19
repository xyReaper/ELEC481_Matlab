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

wnd31 = parameters(cycles,t31_2,t31_1);
clear t31_1 t31_2 cycles;

%Removed 4 masses from upper disk 
%to repeat same experiment
t32_1 = 0.024;
t32_2 = 1.035;
cycles = 6;

wnd32 = parameters(cycles,t32_2,t32_1);
clear t32_1 t32_2 cycles;

%step 9
% X is the amplitude
X0 = 478; %amplitude of t32_1
X6 = 290; %amplitude of t32_2
cycles = 6;
zetad32 = 1/(2*pi*cycles) * log(X0/X6);
disp ('zetad32= ');
disp (zetad32);
%End of upper disk calcs
%% 
%Lower Disk Calculations

t11_2 = 2.3;
t11_1 = 0.2;
cycles = 5;
wnd11 = parameters(cycles,t11_2,t11_1);
clear t11_1 t11_2 cycles_2;
% no mass

t12_2 = 0.6;
t12_1 = 0.062;
cycles = 3;

wnd12 = parameters(cycles,t12_2,t12_1);
clear t12_1 t12_2 cycles;
%step 9
% X is the amplitude

X0 = 485; %amplitude of t32_1
X3 = 49; %amplitude of t32_2
cycles = 3;
zetad12 = double(1/(2*pi*cycles) * log(X0/X3));
disp ('zetad12= ');
disp (zetad12);

mass = 0.5;
Jm = (mass*4)*(0.09)^2;

disp ('Jm= ');
disp (Jm);


syms kd3 J3;

eq1 = kd3/(Jm+J3) ==(wnd31)^2;
eq2 = kd3/J3 == (wnd32)^2;

sol = vpasolve([eq1, eq2], [kd3, J3]);

J3 = double(sol.J3);
kd3= double(sol.kd3);

disp ('J3=');
disp (J3);
disp ('kd3=');
disp (kd3);
clear eq1 eq2

syms kd1 J1;

eq1 = kd1/(Jm+J1) ==(wnd11)^2;
eq2 = kd1/J1 == (wnd12)^2;

sol = vpasolve([eq1, eq2], [kd1, J1]);

J1 = double(sol.J1);
kd1= double(sol.kd1);
disp ('J1=');
disp (J1);

disp ('kd1=');
disp (kd1);

clear eq1 eq2


%done doing shit
%% 
%Claculating damning ratios

syms cd1 cd3;

eq1 = 2*zetad12*wnd12 == cd1/J1;
sol = vpasolve(eq1, cd1);
cd1 = double(sol);

eq2 = 2*zetad32*wnd32 == cd3/J3;
sol = vpasolve(eq2, cd3);
cd3 = double(sol);

disp ('cd1=');
disp (cd1);
disp ('cd3=');
disp (cd3);
clear eq1 eq2 sol

%% 
%remember that c2 and c3 are equal.





