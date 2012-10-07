% (a) Use a library routine for Gaussian elimination to solve the system 
%     Ax=b, where
%
%          2   4  -2
%     A =  4   9  -3
%         -2  -1   7
%
%           2
%     b =   8
%          10
%

A = [2 4 -2; 4 9 -3; -2 -1 7]
b = [2 8 10]'

[L, U] = lu(A);
z = L\b;
x = U\z
