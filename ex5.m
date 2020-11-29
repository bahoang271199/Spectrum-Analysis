% example 8.2.5
% x(n) = Asin(w1n + theta1) + sin(w2n + theta2) + v(n)
% 1. Periodogram
% 2. Bartlett K = 4
% 3.          K = 16

clear all;
clc;

N = 512;
n = [0:N-1];
w1 = 0.2 * pi; w2 = 0.25 * pi;
A = sqrt(10);
theta1 = 2*pi*rand;
theta2 = 2*pi*rand;
Ptb = 0;
for u = 1:50
    vn = randn(1, N);
    xn = A*sin(n*w1 + theta1) + sin(n*w2 + theta2) + vn;
       
    P = periodogram(xn);
    Ptb = Ptb + P;
    P = 10 * log10(P);
    l = length(P);
    norP = ([0:(l-1)]/l *2 *pi)/(pi);
%     figure(1); % variance
    subplot(3, 2, 1);
    plot(norP, P);
    axis([0 1 -20 40])
    hold on
    
end
Ptb = Ptb/50;
Ptb = 10 * log10(Ptb);
% figure(2); % ước lương kỳ vọng của P^

subplot(3, 2, 2)
plot(norP, Ptb)
axis([0 1 -20 40])

for u = 1:50
    vn = randn(1, N);
    xn = A*sin(n*w1 + theta1) + sin(n*w2 + theta2) + vn;
       
    P = bart(xn,4);
    Ptb = Ptb + P;
    P = 10 * log10(P);
    l = length(P);
    norP = ([0:(l-1)]/l *2 *pi)/(pi);
%     figure(1); % variance
    subplot(3, 2, 3);
    plot(norP, P);
    axis([0 1 -20 40])
    hold on
    
end
Ptb = Ptb/50;
Ptb = 10 * log10(Ptb);
% figure(2); % ước lương kỳ vọng của P^

subplot(3, 2, 4)
plot(norP, Ptb)
axis([0 1 -20 40])

for u = 1:50
    vn = randn(1, N);
    xn = A*sin(n*w1 + theta1) + sin(n*w2 + theta2) + vn;
       
    P = bart(xn,32);
    Ptb = Ptb + P;
    P = 10 * log10(P);
    l = length(P);
    norP = ([0:(l-1)]/l *2 *pi)/(pi);
%     figure(1); % variance
    subplot(3, 2, 5);
    plot(norP, P);
    axis([0 1 -20 40])
    hold on
    
end
Ptb = Ptb/50;
Ptb = 10 * log10(Ptb);
% figure(2); % ước lương kỳ vọng của P^

subplot(3, 2, 6)
plot(norP, Ptb)
axis([0 1 -20 40])