clc
clear; 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%producing recieving signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=300000000;
td=3*1e-6;
T=1e-5;
tau=1e-6;
ts=1e-9;
t=0:ts:T;
alpha=0.5;
t_len=length(t);
N=round(t_len/(T/tau));
x=zeros(size(t));
M=round((td/ts)+(t_len/(T/tau)));
pulse_out=alpha*ones(1,N);
x((td/ts)+1:M)=pulse_out;
plot(t,x,'LineWidth',3);
xlim([0 T]);
ylim([0 1]);
title('Recieving signal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%detecting pulse position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y=alpha*ones(1,N);
convolution=conv(Y,x(1,:));
[max1,Index]=max(convolution);
Td=t(Index-N+1);
R=(Td*c)/2;
fprintf('distance of car : %d ',R);
