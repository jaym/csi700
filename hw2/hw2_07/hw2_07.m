%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Jay Mundrawala                                                          %%
%% CSI700 HW2 #7                                                           %%
%% 09/30/2012                                                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

N = 50

a = -1*ones(N,1);
b =  5*ones(N,1);
c = -1*ones(N,1);

[l,u] = tridag_factorize(a,b,c);

z = zeros(N,N);
z(:,1) = 1:N;
for i = 2:N
    z(:,i) = circshift(z(:,i-1),-1);
end

x = tridag_solve(l, u, c, z);

A = toeplitz([5 -1 zeros(1,N-2)]);
res = z - A*x;
