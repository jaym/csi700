%(a)
fa = @(x) acos(-1.0/(1+exp(-2*x)));
ra = fixed_point_iteration(fa,3,10)

%octave:1> ra
%ra =  3.0764


%(b)
fb = @(x) 0.5*log(-1/(1 + (1/cos(x))));
rb = fixed_point_iteration(fb,3,10)

%octave:1> rb
%rb = -0.16977 - 1.54833i


%(c)
fc_d = @(x) -sin(x) + (2*exp(-2*x))/((1 + exp(-2*x))^2);
fc   = @(x) cos(x) + 1.0/(1+exp(-2*x));
gc   = @(x) x - fc(x)/fc_d(x);
rc   = fixed_point_iteration(gc, 3, 10)

%octave:1> rb
%rc =  3.0764

