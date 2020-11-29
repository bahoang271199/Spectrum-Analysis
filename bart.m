function Px = bart(x, nsect)
    
    L = floor(length(x)/nsect);
    Px = 0;
    n1 = 1;
    for i = 1 : nsect
        Px = Px + periodogram(x(n1:n1+L-1))/nsect;
        n1 = n1 + L;
    end;