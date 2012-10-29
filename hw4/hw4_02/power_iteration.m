function [e_max, lambda] = power_iteration(A, x, k)
e_max = x;
for k = 1:k
    y_k = A*e_max;
    e_max = y_k/norm(y_k,inf);
end
e_max = e_max/norm(e_max);
lambda = norm(y_k,inf);
