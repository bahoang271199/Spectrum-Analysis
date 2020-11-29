clear all;
clc;

N = 512;
% n = [0:N-1];
vn = randn(1, N);

x = zeros(1, N);
x(1, 1) = 2*randn;
x(1, 2) = 0.95*x(1, 1) + 2*randn;
for n = 3:N
    x(1, n) = 0.95*x(1, n-1) - 0.9025*x(1, n-2) + 2*randn;
end
figure(1);
plot(x);

 w = 0:pi/N:pi;
 j = sqrt(-1);
 
P = 4./(abs(1 + (-0.95)*exp(-j*w) + (0.9025)*exp(-j*3*w)));
P = P.^2;
figure(2);
 plot(w/pi, P);
 
 pe = periodogram(x);
 
    pe = 10 * log10(pe);
    l = length(pe); %1024
    norP = ([0:(l-1)]/l *2 * pi)/pi;
    
 figure(3);
 plot(norP,pe);