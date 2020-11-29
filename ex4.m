clear all;
clc;

N = 128;
n = [0:N-1];
w1 = 0.2 * pi; w2 = 0.3 * pi;
A1 = 0.1; A2 = 1;



vn = randn(1, N);
xn = A1*sin(n*w1) + A2*sin(n*w2) + vn;
    
wn = hamming(N);
    
P = mper(xn,2);
    % 1: rectangular
    % 2: hamming
    % 3: hanning
    % 4: bartlett
    % 5: blackman

norx = (n/N * 2*pi)/pi;
    
   
    
 W = fft(wn)

   

