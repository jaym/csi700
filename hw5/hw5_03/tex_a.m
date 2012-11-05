%(a)
fa = @(x) acos(-1.0/(1+exp(-2*x)));
ra = fixed_point_iteration(fa,3,10)

%octave:1> ra
%ra =  3.0764
