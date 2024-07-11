clc
clear; 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%signal features
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=300000000;
R=450;
td=2*R/c;
T=1e-5;
tau=1e-6;
ts=1e-9;
t=0:ts:T;
t_len=length(t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%producing sending pulse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=zeros(size(t));
N=round(t_len/(T/tau));
pulse=0.5*ones(1,N);
x(1:N)=pulse;
subplot(2,1,1);
plot(t,x,'LineWidth',3);
title ('Question 2 part 1')
xlim([0 T]);
ylim([0 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%producing recieving pulse (Question 2 part 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=zeros(size(t));
M=round((td/ts)+(t_len/(T/tau)));
pulse_out=0.5*ones(1,N);
x((td/ts)+1:M)=pulse_out;
subplot(2,1,2);
plot(t,x,'LineWidth',3);
title ('Question 2 part 2')
xlim([0 1e-5]);
ylim([0 1]);
