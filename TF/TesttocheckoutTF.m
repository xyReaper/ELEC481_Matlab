
i=importdata('timecountpos1pos2.txt');
time=i.data(:,2);
pos1=i.data(:,3);
pos2=i.data(:,4);
figure
plot(time,pos1,time,pos2);