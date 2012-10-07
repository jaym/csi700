% (b) Use the LU factorization of A already computed to solve the system
%     Ay = c, where
%
%            4
%      c =   8
%           -6
%

c = [2 8 -6]'
z = L\c;
y = U\z
