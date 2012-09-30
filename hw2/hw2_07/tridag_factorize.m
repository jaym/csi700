function [l, u] = tridiag_factorize(a, b, c)
    u(1) = b(1);
    for i = 2:size(b,1)
        l(i-1) = a(i-1)/u(i-1);
        u(i) = b(i) - l(i-1)*c(i-1)
    end
end
