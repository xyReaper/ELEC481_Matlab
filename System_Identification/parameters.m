%%% function used to obtain system parameters
function [wndxx] = parameters(cycles,t2,t1)

T = (t2-t1)/cycles;
frequency = 1/T;
wndxx = 2*pi*frequency;

end