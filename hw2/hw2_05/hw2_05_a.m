m = 33
for n = 2:m
    n
    H = hilb(n);
    conds(n) = cond(H);
    b = H*ones(n,1);
    try
        L = chol(H, 'lower');
        x_approx = L'\(L\b);
    catch
        try
            x_approx = H\b;
        catch
            m = n-1
            break;
        end
    end
    residuals(n) = norm(b - H*x_approx,Inf);
    dx = norm(x_approx - ones(n,1),Inf);
    rel_errs(n) = dx;
end

plot(conds)
title("Condition Number")
xlabel("n");
figure

plot(log10(rel_errs));
title("log10(Relative Error)");
xlabel("n");
figure;
plot(log10(residuals));
xlabel("n");
