clear
clc
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=1; %length of the sampling area
Alpha=0.5;
Beta=0.3;
R=250 *1e3;
V=180 /3.6;
C=3*1e8;
P=2/C;
t_d=P*R;
f_s=100; %sampling frequence
f_c=5;
f_d=Beta*V;
t_s=1/f_s; %Time-distance between two samples
N=T/t_s;
t_start=0;
t_end= 1;
t=t_start:t_s:t_end-t_s;
f=-f_s/2:f_s/N:f_s/2-f_s/N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noise=0.1*randn(1,length(f));
y_n =noise+Alpha*cos(2*pi*(f_c + f_d)*(t-t_d));%received signal

figure 
y_Fn=fftshift(fft(y_n)); %Transforming to recieving signal to fourier form in frequence scale 
y_Fn=y_Fn/max(abs(y_Fn));
[Max,j]=max(y_Fn);

subplot(1,2,1)
plot(t,abs(y_n));
title("recieved signal")
subplot(1,2,2)
plot(f,abs(y_Fn));
title("recieved signal transformed to fourier space")

f_d_match=abs(f(j)) - f_c;
V_match=(f_d_match/Beta)*3.6
t_d_match=angle(y_Fn(j))/(-2*pi*f(j));
R_match=t_d_match/P
