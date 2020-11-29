Fc = 0.4;
N = 100;
Hf = fdesign.lowpass('N,Fc',N,Fc);
Hd1 = design(Hf,'window','window',@hamming,'systemobject',true);
Hd2 = design(Hf,'window','window',{@chebwin,50}, ...
            'systemobject',true);
hfvt = fvtool(Hd1,Hd2,'Color','White');
legend(hfvt,'Cửa sổ Hamming', ...
       'Cửa sổ Dolph-Chebyshev')

Hf.FilterOrder = 200;
Hd3 = design(Hf,'window','window',{@chebwin,50},...
            'systemobject',true);
hfvt2 = fvtool(Hd2,Hd3,'Color','White');
legend(hfvt2,'Cửa sổ Dolph-Chebyshev. Order = 100',...
    'Cửa sổ Dolph-Chebyshev. Order = 200')

Fp = 0.38;
Fst = 0.42;
Ap = 0.06;
Ast = 60;
setspecs(Hf,'Fp,Fst,Ap,Ast',Fp,Fst,Ap,Ast);
Hd4 = design(Hf,'kaiserwin','systemobject',true);
measure(Hd4)
Hd5 = design(Hf,'equiripple','systemobject',true);
hfvt3 = fvtool(Hd4,Hd5,'Color','White');
legend(hfvt3,'Kaiser window design','Equiripple design')
