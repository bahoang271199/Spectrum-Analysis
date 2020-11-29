clear all;
clc;

ws1 = 0.2*pi; 
wp1 = 0.35*pi; 
wp2 = 0.55*pi; 
ws2 = 0.75*pi; 
Rp = 0.25;
As = 40;

[delta1,delta2] = db2delta(Rp,As);
if (delta1 < delta2)
delta2 = delta1; disp(’Delta1 is smaller than delta2’)
[Rp,As] = delta2db(delta1,delta2)
end

tr_width = min((wp1-ws1),(ws2-wp2));
M = ceil(6.2*pi/tr_width); M = 2*floor(M/2)+1, % choose odd M

n = 0:M-1; w_han = (hann(M));
wc1 = (ws1+wp1)/2; wc2 = (ws2+wp2)/2;
hd = ideal_lp(wc2,M)-ideal_lp(wc1,M); h = hd .* w_han;
[db,mag,pha,grd,w] = freqz_m(h,1); delta_w = pi/500;
Rpd = -min(db((wp1/delta_w)+1:(wp2/delta_w)+1)), % Actual passband ripple

Asd = floor(-max(db(1:(ws1/delta_w)+1))), % Actual Attn
