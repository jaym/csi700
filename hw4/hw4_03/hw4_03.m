A = [6 2 1; 2 3 1; 1 1 1];
[v_real, lambda_real] = eig(A)

iterations = 15;

distance = Inf;
for k = 1:size(v_real,2)
    d = norm(v_real(:,k) - 2);
    if  d < distance
        distance = d;
        v_closest = v_real(:,k);
        lambda_closest = lambda_real(:,k);
    end
end

v_k = zeros(1,iterations);
l_k = zeros(1,iterations);
for k = 1:iterations
    [v,l] = inverse_iteration(A, ones(3,1), 2, k);
    v_k(k) = norm(v - v_closest, inf);
    l_k(k) = norm(l - norm(lambda_closest,inf));
end
h = figure;
plot(-1*log10(v_k),'LineWidth', 2);
title("Correct Significant Digits for Eigenvector");
xlabel("k");
ylabel("Digits");
print(h, 'hw4_03_eigenvec.pdf')
h = figure;
plot(-1*log10(l_k), 'LineWidth', 2);
title("Correct Significant Digits for Eigenvalue");
xlabel("k");
ylabel("Digits");
print(h, 'hw4_03_eigenval.pdf')
