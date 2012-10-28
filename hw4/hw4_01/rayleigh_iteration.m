function [e_max,lambda] = rayleigh_iteration(A, x, k)
e_max = x;
for i = 1:k
    if i <= 3
	    shift = (e_max'*A*e_max)/(e_max'*e_max);
    end
    B = (A - shift*eye(size(A)));
    y = B\e_max;
    e_max = y/norm(y,inf);
end
e_max = e_max/norm(e_max);
lambda = shift;
