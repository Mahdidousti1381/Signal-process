clc
clear
close all
%Giving input
prompt = "Enter number and press enter: \n 1 2 3 \n 4 5 6 \n 7 8 9 \n * 0 # \n :";
txt = input(prompt,"s");
inputstr=txt;
number=[];
%Reading input and saving data as numeric values
for i=1:length(inputstr)
if inputstr(i)=='*'
 number(i)=10;
elseif inputstr(i)=='#'
 number(i)=12;
else
   number(i)=str2num(inputstr(i));
end
end
%saving 2-D coordination of numbers based on telephone keyboard pattern
k=[];
j=[];
tedadseda=length(number);
for i=1:tedadseda
     temp=number(i);
      k(i)=floor(temp/3-0.0001)+1;
      j(i)=temp-(k(i)-1)*3;
end
%coding each value based on frequence of the keys
fr =[697 770 852 941];
fc =[1209 1336 1447];
fs=8000;
ts=1/fs;
tonn=0.1;
toff=0.1;
t1=0:ts:tonn-ts;
t2=0:ts:toff-ts;
%producing sound signal for each specific key
y1=sin(2*pi*fr(k(1))*t1);
y2=sin(2*pi*fc(j(1))*t1);
temp0=0*t2;
for q=2:tedadseda
temp2=sin(2*pi*fr(k(q))*t1);
y1=[y1 temp0];
y1=[y1 temp2];
temp3=sin(2*pi*fc(j(q))*t1);
y2=[y2 temp0];
y2=[y2 temp3];
end
y1=[y1 temp0];
y2=[y2 temp0];
y=(y1+y2)/2;
%saving audiofile
sound(y,fs)
filename = 'C:\Users\Asus\Desktop\University\Term 4\Signal & System\CA2\Q3\y.wav';
audiowrite(filename,y,fs);

