%(b)
fb = @(x) 0.5*log(-1/(1 + (1/cos(x))));
rb = fixed_point_iteration(fb,3,10)

%octave:1> rb
%rb = -0.16977 - 1.54833i
