clc
close all;
clear;
%saving 2-D coordination of numbers based on telephone keyboard pattern
k=[];
j=[];
%coding each value based on frequence of the keys
fr =[697 770 852 941];
fc =[1209 1336 1447];
fs=8000;
ts=1/fs;
tonn=0.1;
toff=0.1;
%Allocating signal of sound of each key to a specific index of a matrix
y_shenase=zeros(4,3,(fs*tonn));
for l=1:4
    for c=1:3
        t=0:ts:tonn-ts;
         tempy2=sin(2*pi*fc(c)*t);
         tempy1=sin(2*pi*fr(l)*t);
         y_shenase(l,c,:)=(tempy1+tempy2)/2;
    end
end
%Giving audiofile as input 
[a,fs]=audioread('a.wav');
decode=[];
temp4=[];
temp5=[];
maxdot=zeros(1,12);
outnum=[];
maxx=[];
%Mathing each part of input with matrix of signals of sounds of any key
for u=1:(fs*tonn):length(a)
    temp4(1:(fs*tonn))=a(u:(u+(fs*tonn)-1));
    for row=1:4
        for col=1:3
   temp5(1:(fs*tonn))=y_shenase(row,col,:);
            maxdot(3*row+col-3)=dot(temp5,temp4);
        end
    end
    %Saving matched signals in an array
[max1,position]=max(maxdot);
outnum((u-1)/(fs*tonn)+1)=position;
end
%Converting numeric values to characters
for i=1:2:length(outnum)
    if outnum(i) == 10
      fprintf('*') ;
    elseif outnum(i) == 11
      fprintf('0') ;
    elseif  outnum(i) == 12
         fprintf('#') ; 
    else
      fprintf('%d',outnum(i));
    end
end
