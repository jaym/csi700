% The polynomial (x-1)^6 has the value zero at x = 1 and is positive elsewhere.
% The expanded form of the polynomial, 
% x^6 - 6x^5 + 15x^4 -20x^3 + 15x^2 - 6x + 1, is mathematically equivalent but 
% may not give the same result numerically. Compute and plot the values of this 
% polynomial, using each of the two forms, for 101 equally spaced points in the 
% interval [0.995, 1.005]. Your plot should be scaled so that the values of x 
% and for the polynomial use the full ranges of their respective axes. Explain 
% this behavior.

polynomial = @(x) (x-1).^6;
expanded = @(x) x.^6 - 6*x.^5 + 15*x.^4 - 20*x.^3 + 15*x.^2 - 6*x + 1;

x = linspace(0.995, 1.005, 101);

p = plot(x, polynomial(x));
set(p, 'LineWidth', 2);
legend("(x-1).^6");
hold on
plot(x, polynomial(x) + 22*2.23e-16);
plot(x, polynomial(x) - 22*2.23e-16);
p = plot(x, expanded(x));
set(p, 'Color', 'red', 'LineWidth', 2);
legend("x.^6 - 6*x.^5 + 15*x.^4 - 20*x.^3 + 15*x.^2 - 6*x + 1");
hold off

