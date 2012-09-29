
A = [1 2 -1 0; 
     3 4 0 1; 
     0 2 5 4; 
     1 2 3 4]

b = [2 15 35 30]'
c = [-3 -3 0 -3]'

x_m = A \ b
y_m = A \ c

x = [1 2 3 4]'
y = [1 -1 2 -2]'

fprintf("absolute error (x' - x):\n");
abs(x_m - x)
fprintf("relative error (x' - x):\n");
abs(x_m - x) ./ x

fprintf("absolute error (y' - y):\n");
abs(y_m - y)
fprintf("relative error (y' - y):\n");
abs(y_m - y) ./ y
