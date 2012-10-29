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
l_power = zeros(1,iterations);
for i = 1:iterations
    [v,l] = power_iteration(A, x, i);
    v_power(i) = norm(v - v_real_max,inf);
    l_power(i) = abs(l - norm(lambda_max,inf));
end

v_rayleigh = zeros(1,iterations);
l_rayleigh = zeros(1,iterations);
for i = 1:iterations
    [v,l] = rayleigh_iteration(A, x, i);
    v_rayleigh(i) = norm(abs(v) - abs(v_real_max),inf);
    l_rayleigh(i) = abs(l - norm(lambda_max,inf));
end

plot(-1*log10(l_power), 'b');
hold on;
plot(-1*log10(l_rayleigh), 'r');
plot(-1*log10(v_power), 'g')
plot(-1*log10(v_rayleigh), 'y')

title('Correct Significant Digits');
xlabel('Iterations');
ylabel('Digits');
h_legend = legend("Power Iteration Eigenvalue", 
"Rayleigh Iteration Eigenvalue", 
"Power Iteration Eigenvector", 
"Rayleigh Iteration Eigenvector");
set(h_legend,'FontSize',10);
legend boxon
matlab2tikz('hw4_01_plot.tikz', 'height','\figureheight','width', '\figurewidth');
hold off;
