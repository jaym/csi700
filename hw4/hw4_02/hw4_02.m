A = [ 
      2 3 2; 
     10 3 4; 
      3 6 1
    ];

iterations = 100;
%(a)
[v,l] = power_iteration(A, [0 0 1]', iterations);

%(b)
[V,L] = deflation(A, [0 0 1]', iterations);

[sorted_eigenvals, sorted_eigenvals_idx] = sortrows(abs(L'));
sorted_eigenvectors = zeros(size(V));
for i = 1:size(sorted_eigenvals_idx)
    sorted_eigenvectors(:,i) = V(:,sorted_eigenvals_idx(i));
    sorted_eigenvectors(:,i) = sorted_eigenvectors(:,i)/norm(sorted_eigenvectors(:,i));
end

%(c)
[vr,_lr] = eig(A);
lr = zeros(1,size(_lr,2));
for i = 1:size(_lr,1)
    lr(i) = norm(_lr(:,i));
end

[sorted_eigenvals_r, sorted_eigenvals_idx_r] = sortrows(abs(lr'));
sorted_eigenvectors_r = zeros(size(V));
for i = 1:size(sorted_eigenvals_idx_r)
    sorted_eigenvectors_r(:,i) = vr(:,sorted_eigenvals_idx_r(i));
    sorted_eigenvectors_r(:,i) = sorted_eigenvectors_r(:,i)/norm(sorted_eigenvectors_r(:,i));
end

disp('Eigenvalue 1 difference')
norm(sorted_eigenvals(3)) - norm(sorted_eigenvals_r(3))
disp('Eigenvalue 2 difference')
norm(sorted_eigenvals(2)) - norm(sorted_eigenvals_r(2))
disp('Eigenvalue 3 difference')
norm(sorted_eigenvals(2)) - norm(sorted_eigenvals_r(2))
disp(' ')
disp('Eigenvector 1 difference')
norm(sorted_eigenvectors(:,3) - sorted_eigenvectors_r(:,3))
disp('Eigenvector 2 difference')
norm(-1*sorted_eigenvectors(:,2) - sorted_eigenvectors_r(:,2))
disp('Eigenvector 3 difference')
norm(sorted_eigenvectors(:,1) - sorted_eigenvectors_r(:,1))

%%%OUTPUT
%
%octave:208> hw4_02
%Eigenvalue 1 difference
%ans =  3.5527e-15
%Eigenvalue 2 difference
%ans =  8.8818e-16
%Eigenvalue 3 difference
%ans =  8.8818e-16
% 
%Eigenvector 1 difference
%ans =  2.2888e-16
%Eigenvector 2 difference
%ans =  2.8331e-16
%Eigenvector 3 difference
%ans =  1.1677

