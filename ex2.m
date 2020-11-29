clear all;
clc;
N = 64;
n = [0:N-1];
A1 = 5;
A2 = 0.5;
w1 = 0.4 * pi;
w2 = 0.43 * pi
Ptb = 0;
for u = 1:50
    vn = randn(1, N);
    norx = (n/N * 2*pi)/pi;
    xn = A1 * sin(w1*n) + A2 * cos(w2*n)+ vn;
    P = periodogram(xn);
    P = 10 * log10(P);
    l = length(P); %1024
    norP = ([0:(l-1)]/l *2 * pi)/pi;
    figure(1); % variance, không phụ thuộc N
    plot(norP, P);
    hold on
    Ptb = Ptb + P;

end
Ptb = Ptb/50;
% Ptb = 10 * log10(Ptb);
figure(2); % ước lương kỳ vọng của P^
plot(norP, Ptb)
