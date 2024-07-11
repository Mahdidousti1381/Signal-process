clc
close all;
clear;
N=100;
t_s=0.01;
f_s=1/t_s;
f=-f_s/2:f_s/N:f_s/2-f_s/N;
bitrate=1;
y ='signal';
amp=cell(1);
for b=1:bitrate
amp{1,b}=dec2bin(b-1,bitrate);
end
mapset = cell(2,32);
for i=1:32
    mapset{1,i}= char(i+96);
    mapset{2,i} = dec2bin(i-1,5);
end
mapset{1,32}= ' ';
mapset{1,28}= '.';
mapset{1,29}= ',';
mapset{1,30}= '!';
mapset{1,31}= ';';
mapset{1,27}= '”';
[p]=coding_freq(y,bitrate,mapset);
decoding_freq(p,bitrate,mapset,f);