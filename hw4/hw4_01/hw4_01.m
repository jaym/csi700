A = hilb(5);
iterations = 15;
[v_real, lambda] = eig(A);
v_real_max = zeros(5,1);
lambda_max = 0;
x = ones(5,1);
x = [5,3,3,4,5]';
#x = [1,2,3,4,5]';
x = x/norm(x);
for k = 1:size(v_real,2)
    if norm(lambda(:,k),inf) > lambda_max
        v_real_max = v_real(:,k);
        lambda_max = norm(lambda(:,k),inf);
    end
end

v_power = zeros(1,iterations);
for i = 1:iterations
    [v,l] = power_iteration(A, x, i);
    v_power(i) = norm(v - v_real_max,inf);
    #v_power(i) = abs(l - lambda_max);
end

plot(-1*log10(v_power));

hold on;

v_rayleigh = zeros(1,iterations);
for i = 1:iterations
    [v,l] = rayleigh_iteration(A, x, i);
    v_rayleigh(i) = norm(abs(v) - abs(v_real_max),inf);
    #v_rayleigh(i) = abs(l - lambda_max);
end

plot(-1*log10(v_rayleigh));

hold off;
