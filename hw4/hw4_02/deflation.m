function [V, L] = deflation(A, x, k)
    x = x/norm(x);
    [v,l] = power_iteration(A, x((size(x,1) - size(A,1)+1):size(x,1),1), k);
    %[v,l] = power_iteration(A, rand(size(A,1),1), k);
    H = householder(v, eye(size(A,1),1));
    T = H*A*H';

    L = T(1,1);
    V = v/norm(v);

    if size(A,1) > 1
        [VV, LL] = deflation(T(2:size(T,1),2:size(T,2)), x, k);
        for i = 1:size(VV,2)
            b_t = T(1,2:size(T,2));
            z = H*[(b_t*VV(:,i))/(LL(i)-l);VV(:,i)];
            V = [V z];
        end

        L = [L LL];
    end
    
