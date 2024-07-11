close all;
clear ;
clc;
f_s = 100;
t_s = 1/f_s;
t_start = 0;
t_end = 1;
t = t_start:t_s:t_end-t_s;
x = cos(10*pi*t);
figure(1)
plot (t,x)
title('1-2-A')
subtitle('x = cos(30*pi*t+pi/4);')
y = fftshift(fft(x));
mx = max(abs(y));
yprime = y / mx;
N = size(y,2);
f = -f_s/2:f_s/N:f_s/2-f_s/N;
figure(2)
plot(f,angle(yprime))
title('1-2-B')
subtitle('Magnitude of x based on frequency')
tol = 1e-6;
yprime(abs(yprime)<tol) = 0;
theta = angle(yprime);
figure(3)
plot(f, theta/pi)
title('1-2-C')
subtitle('Phase of x based on frequency')
xlabel 'frequency(hz)';
ylabel 'phase/\pi';
