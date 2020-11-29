
N = 2048;
n = [0:N-1];
vn = randn(1, N)
norv = (n/N * 2*pi)/pi;
figure(1);
stem(norv, vn);
P = periodogram(vn);
P = 10 * log10(P);
norP = ([0:1023]/1024 * 2 * pi)/pi;
figure(2);
plot(norP,P);