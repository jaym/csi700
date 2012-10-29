function [e_max,lambda] = rayleigh_iteration(A, x, k)
e_max = x;
iterate = 1;
lastShift = 0;
for i = 1:k
    shift = (e_max'*A*e_max)/(e_max'*e_max);
    if iterate == 1
        % Keep B from becoming singular
        B = (A - shift*eye(size(A)));
        if det(B) < eps
            shift = lastShift;
            iterate = 0;
            B = (A - shift*eye(size(A)));
        end
    end
    y = B\e_max;
    e_max = y/norm(y,inf);
    lastShift = shift;
end
e_max = e_max/norm(e_max);
lambda = shift;
