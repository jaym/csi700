function H = householder(a,u)
    v = a + sign(a(1,1))*norm(a)*u;
    H = eye(size(a,1)) - 2 * (v*v')/(v'*v);
