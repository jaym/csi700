f = @(x) sin(10*x) - x;
%(a)
fplot(f, [-2,2]);
grid on
% Function has 7 zeros
matlab2tikz('hw5_02_plot.tikz', 'height','\figureheight','width', '\figurewidth', 'minimumPointsDistance', 0.05);

%(b)
intervals = -1*(7*pi/20):(pi/10):(7*pi/20);
r = [];
for j = 1:(size(intervals,2) - 1)
		v = bisection(f, intervals(j), intervals(j+1),eps);
		r = [v;r];
end

r
%r =
%
%   8.4232e-01
%   7.0682e-01
%   2.8523e-01
%  -6.9757e-17
%  -2.8523e-01
%  -7.0682e-01
%  -8.4232e-01

