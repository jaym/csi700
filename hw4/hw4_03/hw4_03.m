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
v
l
h = figure;
plot(-1*log10(v_k),'b', 'LineWidth', 2);
title("Correct Significant Digits");
xlabel("k");
ylabel("Digits");
hold on;
plot(-1*log10(l_k), 'r', 'LineWidth', 2);
h_legend = legend("Eigen Vector","Eigen Value");
legend boxon;
matlab2tikz('hw4_03_plot.tikz','height','\figureheight','width','\figurewidth');
hold off;

%Output
%v_real =
%
%  -0.043168  -0.497425  -0.866432
%  -0.350731   0.819589  -0.453058
%   0.935481   0.284327  -0.209843
%
%lambda_real =
%
%Diagonal Matrix
%
%   0.57893         0         0
%         0   2.13307         0
%         0         0   7.28799
%
%v =
%
%  -0.49743
%   0.81959
%   0.28433
%
%l =  2.1331

