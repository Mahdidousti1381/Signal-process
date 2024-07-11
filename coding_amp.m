function [tollpayam,signal,p]=coding_amp(y,bitrate,amp,mapset,x , final,signal)
a=length(y);
for i=1:length(y)
for j=1:32
    if strcmp(mapset(1,j),y(i))==1
    x(i)=j;
    end
end
end
for s=1:length(x)
   final=append(final,dec2bin(x(s)-1,5));
end

tollpayam=length(final)-5;
for h=1:bitrate:tollpayam
signal{(h-1)/bitrate +1}=bin2dec(extractBetween(final,5+h,4+h+bitrate));
end
random=0.01*randn(1,100);
t=linspace(0,0.99,100);
k = linspace(0,0.99,100);
p=signal{1}*sin(2*pi*k)/(2^bitrate-1);
p=p+random;
for m=2:length(signal)
temp = linspace(m-1,m-0.01,100);temp2=signal{m}*sin(2*pi*k)/(2^bitrate-1);
random=0.01*randn(1,100);
temp2=temp2+random;
t =[t temp];
p=[p temp2];
end
plot(t,p)
title('bitrate=1')
end