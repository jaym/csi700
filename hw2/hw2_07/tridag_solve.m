%%Solve Ax = z
function x = tridag_solve(l, u, c, z)
%% Solve Ly=z
    y = zeros(size(z,1),1);
    y(1) = z(1);
    for i = 2:size(z,1)
        y(i) = z(i) - l(i-1)*y(i-1);
    end
%%Solve Ux = y
    x(size(z,1)) = y(size(z,1))/u(size(z,1));
    for i = size(z,1)-1:-1:1
        x(i) = (y(i) - c(i)*x(i+1))/u(i);
    end
end
