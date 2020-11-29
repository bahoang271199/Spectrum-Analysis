clear all;
clc;

N = 40;
n = [0:N-1];
w1 = 0.4 * pi; w2 = 0.45 * pi;
A = 5;
deltaw = 0.05 * pi;
Ptb = 0;
for u = 1:50
    vn = randn(1, N);
    xn = A*sin(n*w1 + deltaw) + A *sin(n*w2) + vn;
    
    
    P = mper(xn, 3);
    % 1: rectangular
    % 2: hamming
    % 3: hanning
    % 4: bartlett
    % 5: blackman

    norx = (n/N * 2*pi)/pi;
    Plog = 10 * log10(P);
    l = length(P);
    norP = ([0:(l-1)]/l *2 * pi)/pi;
    figure(1);  % variance
    plot(norP, Plog);
    hold on;
    Ptb = Ptb + P;
end
Ptb = Ptb/50;
% Ptb = 10 * log10(Ptb);
figure(2); % ước lương kỳ vọng của P^
plot(norP, Ptb)