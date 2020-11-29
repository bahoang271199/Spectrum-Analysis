a = [0 1; 0 -2];
b = [0; 1];
c = [10 0];
d = 0;
Ts = 1;

[ad, bd, cd, dd] = c2dm(a, b, c, d, Ts, 'tustin')
c2d(a, b, c, d, Ts, 'tustin')
title('do thi so sanh dap ung lien tuc va gian doan')
grid on