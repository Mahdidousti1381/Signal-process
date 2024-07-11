clc
close all;
clear;
bitrate=3;
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
x=[];
y ='am ';
a=length(y);
for i=1:length(y)
for j=1:32
    if strcmp(mapset(1,j),y(i))==1
    x(i)=j;
    end
end
end
ccp=31;
final='11111';
for s=1:length(x)
   final=append(final,dec2bin(x(s)-1,5));
end

tollpayam=length(final)-5;
signal= cell(1);
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
kkkkkkkkkkkkk = linspace(0,0.99,100);shenase=2*sin(2*pi*kkkkkkkkkkkkk);
flag1=[];
for u=1:length(signal)
  flag1(u)= round((dot(p(:,100*(u-1)+1:100*u),shenase)*(2^(bitrate)-1)/100));
  
end
decoding='11111';
for s=1:length(flag1)
    decoding=append(decoding,dec2bin(flag1(s),bitrate));
end

payam=cell(2,tollpayam/5);
for w=1:tollpayam/5
  payam{1,w} = extractBetween(decoding,6+(w-1)*5,10+(w-1)*5);
end

for q=1:size(payam,2)
    for z=1:32
        if strcmp(payam{1,q},mapset{2,z})==1
            payam{2,q}=mapset{1,z};
        end
    end
end
fprintf('payam=\n %s','');
for s=1:size(payam,2)
fprintf('%s',payam{2,s})
end