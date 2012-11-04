g = 9.8065;
k = 0.00341;
d = 1000.0;
f = @(t) (log(cosh(t*sqrt(g*k))))/k - d;
est_t = sqrt((2*d)/g)
t = fzero(f,est_t)

%octave:13> hw5_04
%est_t =  14.281
%t =  22.436
