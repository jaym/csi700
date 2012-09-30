%%Solve Ax = z
function x = tridag_solve(l, u, c, z)
    for col = 1:size(z,2)
%% Solve Ly=z
        y(1) = z(1,col);
        for i = 2:size(z,1)
            y(i) = z(i,col) - l(i-1)*y(i-1);
        end
%%Solve Ux = y
        x(size(z,1),col) = y(size(z,1))/u(size(z,1));
        for i = size(z,1)-1:-1:1
            x(i,col) = (y(i) - c(i)*x(i+1,col))/u(i);
        end
    end
end
