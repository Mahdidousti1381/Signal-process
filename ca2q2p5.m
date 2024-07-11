clc
clear; 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%producing recieving signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=300000000;
td=3*1e-6;
alpha=0.5;
T=1e-5;
tau=1e-6;
ts=1e-9;
t=0:ts:T;
t_len=length(t);
N=round(t_len/(T/tau));
x=zeros(size(t));
M=round((td/ts)+(t_len/(T/tau)));
pulse_out=alpha*ones(1,N);
x((td/ts)+1:M)=pulse_out;
%Applying niose
x=x+alpha*randn(size(x));
%%%%most posible noise for amplitude=0.5 is 0.5
plot(t,x,'LineWidth',3);
xlim([0 T]);
ylim([-10 10]);
title('Recieving signal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%detecting pulse position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y=alpha*ones(1,N);
cors=zeros(size(t));
temp=[];
for i=1:t_len-N-1
    temp=x(1,i:N+i-1);
    correlation =dot(temp,Y);
    cors(1,i)=correlation;
end    
[maxcor,I]=max(cors);
Td=t(I);
R=(Td*c)/2;
fprintf('distance of car : %d ',R);
