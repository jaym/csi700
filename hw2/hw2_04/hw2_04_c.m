% (c) If the matrix A changes so that a_{1,2} = 2, use the Sherman-Morrison
%     updating technique to compute the new solution x without refactoring
%     the matrix, using the original right-hand-side vector b
%
%     w = x + az
%
%       where
%
%     a = (v' * y)(1 - v'*z)

u = [1 0 0]';
v = [0 2 0]';
z = A \ u;
a = (v' * x) / (1 - v' * z);

w = x + a*z
