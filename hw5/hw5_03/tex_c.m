%(c)
fc_d = @(x) -sin(x) + (2*exp(-2*x))/((1 + exp(-2*x))^2);
fc   = @(x) cos(x) + 1.0/(1+exp(-2*x));
gc   = @(x) x - fc(x)/fc_d(x);
rc   = fixed_point_iteration(gc, 3, 3)

%octave:1> rb
%rc =  3.0764

