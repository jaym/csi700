iterations = 10;
x0 = [-0.5; 1.4];

%(a)
x = x0;

f_1 = @(x) (x(1) + 3) * (x(2)^3 - 7) + 18;
df1_dx1 = @(x) x(2) - 7;
df1_dx2 = @(x) 3*x(1)*(x(2)^2) + 9*(x(2)^2);

f_2 = @(x) sin(x(2)*exp(x(1)) - 1);
df2_dx1 = @(x) x(2)*exp(x(1)) * cos(x(2)*exp(x(1)) - 1);
df2_dx2 = @(x) exp(x(1)) * cos(x(2)*exp(x(1)) - 1);


residual_newton = zeros(1,iterations);
for k = 1:iterations
    J_f = [df1_dx1(x), df1_dx2(x);
           df2_dx1(x), df2_dx2(x)];
    s = J_f \ (-1*[f_1(x); f_2(x)]);
    x = x + s;
    residual_newton(k) = norm(x - [0;1], 2);
end
