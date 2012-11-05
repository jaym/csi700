iterations = 10;
x0 = [-0.5; 1.4];

%(b)
x = x0;
residual_broyden = zeros(1,iterations);
%B = eye(2,2);  %Does not work
B = [df1_dx1(x), df1_dx2(x);
       df2_dx1(x), df2_dx2(x)];
fx = [f_1(x); f_2(x)];
for k = 1:iterations
    s = B \ (-1*[f_1(x); f_2(x)]);
    x = x + s;
    _fx = [f_1(x); f_2(x)];
    y = _fx - fx;
    fx = _fx;
    residual_broyden(k) = norm(x - [0;1], 2);
    B = B + ((y - B*s)*s')/(s'*s);
end
