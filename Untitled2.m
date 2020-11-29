clear all;
clc;

%% Yêu cầu đầu vào
ws1 = 0.4 * pi; % lower stopband edge
ws2 = 0.6 * pi; % upper stopband edge
wp1 = 0.3 * pi; % lower passband edge
wp2 = 0.7 * pi; % upper passband edge
As = 50;    % stopband attenuation
Rp = 0.5;   % passband ripple

%
[delta1, delta2] = db2delta(Rp, As);
if (delta1 < delta2)
    delta2 = delta1; disp('Delta1 nhỏ hơn delta2');
    [Rp, As] = delta2db(delta1, delta2);
end
%
tr_width = abs(min((wp1-ws1),(ws2-wp2)));
M = ceil(6.6*pi/tr_width); M = 2*floor(M/2)+1;
n = 0:M-1; w_ham = (hamming(M))';
wc1 = (ws1+wp1)/2; wc2 = (ws2+wp2)/2;
hd = ideal_lp(pi,M)+ideal_lp(wc1,M)-ideal_lp(wc2,M); h = hd .* w_ham;
[db,mag,pha,grd,w] = freqz_m(h,1); delta_w = pi/500;
Asd = floor(-max(db(ceil(ws1/delta_w)+1:floor(ws2/delta_w)+1))); % Asd thực

Rpd = -min(db(1:floor(wp1/delta_w)+1)); % passband ripple thực

%% Đồ thị
Hf_1 = figure('Units','inches','position',[1,1,6,4],'color',[0,0,0],...
'paperunits','inches','paperposition',[0,0,6,4]);
set(Hf_1,'NumberTitle','off','Name','P7.10');
subplot(2,2,1); Hs_1= stem(n,hd,'filled'); set(Hs_1,'markersize',3);
title('Ideal Impulse Response'); set(gca,'XTick',[0;M-1],'fontsize',8)
axis([-1,M,min(hd)-0.1,max(hd)+0.1]); xlabel('n'); ylabel('h_d(n)')
subplot(2,2,2); Hs_1 = stem(n,w_ham,'filled'); set(Hs_1,'markersize',3);
axis([-1,M,-0.1,1.1]); xlabel('n'); ylabel('w_{ham}(n)'); title('Hamming Window');
set(gca,'XTick',[0;M-1],'fontsize',8); set(gca,'YTick',[0;1],'fontsize',8)
subplot(2,2,3); Hs_1 = stem(n,h,'filled'); set(Hs_1,'markersize',3);
title('Actual Impulse Response'); set(gca,'XTick',[0;M-1],'fontsize',8)
axis([-1,M,min(hd)-0.1,max(hd)+0.1]); xlabel('n'); ylabel('h(n)')
subplot(2,2,4); plot(w/pi,db,'linewidth',1); title('Magnitude Response in dB');
axis([0,1,-As-30,5]); xlabel('\omega/\pi'); ylabel('Decibels')
set(gca,'XTick',[0;0.3;0.4;0.6;0.7;1])
set(gca,'XTickLabel',[' 0 ';'0.3';'0.4';'0.6';'0.7';' 1 '],'fontsize',8)
set(gca,'YTick',[-50;0]); set(gca,'YTickLabel',[' 50';' 0 ']);grid