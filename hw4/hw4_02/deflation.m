function [V, L] = deflation(A, x, k, iter)
    A
    [v,l] = power_iteration(A, ones(size(A,1),1), k);
    H = householder(v, eye(size(A,1),1));
    T = H*A*H';

    L = T(1,1);
    V = v;

    if size(A,1) > 1
        [VV, LL] = deflation(T(2:size(T,1),2:size(T,2)), x, k, iter+1);
        for i = 1:size(VV,2)
            b_t = T(1,2:size(T,2));
            z = H*[(b_t*VV(:,i))/(LL(i)-l);VV(:,i)];
            V = [V z];
        end

        L = [L LL];
    end
    
