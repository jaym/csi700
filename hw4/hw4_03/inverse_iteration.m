function [v,lambda] = inverse_iteration(A, x, shift, k)
v = x;
for i = 1:k
    B = (A - shift*eye(size(A)));
    y = B\v;
    v = y/norm(y,inf);
end
v = v/norm(v);
#lambda = norm(y + shift*eye(size(y)),inf);
lambda = norm(A*v);
