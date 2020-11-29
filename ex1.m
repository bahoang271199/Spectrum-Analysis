%{
Windows 10
Matlab R2020b
%}

%% Example 8.2.1: Periodogram of White Noise
% Samples (length of signal)
N = 32;
n = [0:N-1];
% White noise
vn = randn(1, N);
% Normalize axis
nor_v = n/N;
% Plotting
figure(1);
stem(norv, vn);
% Calculating periodogram
P = periodogram(vn);
P = 10 * log10(P);
% Normalize axis
nor_P = ([0:1023]/512);
% Plotting
figure(2);
h = plot(norP, P); axis([0 1 -30 10]);
