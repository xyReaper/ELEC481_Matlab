%%% function used to obtain system parameters
[frequency,wndxx]=parameter[t2,t1,cycles];

t32_1= 0.024;
t32_2= 1.035;
cycles = 6;
T32= (t32_2-t32_1)/cycles;
f32=1/T32;
wnd32=2*pi*f32;