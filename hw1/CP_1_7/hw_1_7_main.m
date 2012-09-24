%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Jay Mundrawala                                                          %%
%% CSI700 HW1 CP 1.7                                                       %%
%% 09/22/2012                                                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% (a) Write a program to compute an approximate value for the derivative of a 
%     function using the finite-difference formula:
%     f'(x) ~= (f(x+h) - f(x))/h
%     Test your program using the function tax(x) or for x=1. Determine the
%     error by comparing with the square of the built-in function sec(x). Plot
%     the magnitude of the error as a function of h, for h = 1E-k, k =0..16.
%     You should use log scale for h and for the magnitude of the error. 
%     Is there a minimum value for the magnitude of the error? How does the 
%     corresponding value for h compare with the rule of thumb 
%     h ~= sqrt(epsilon_match) derived in example 1.3 (page 8)?
% (b) Repeat for f'(x) ~= (f(x + h) - f(x - h)) / 2h

x = 1;
h = 10 .^ (-1*(1:16));
v = finite_difference_first_order_accurate(@tan, x, h);

p = plot(log10(h), log10(abs(v - sec(x))))
set(p,'LineWidth',2)
xlabel("log(h)")
ylabel("log(magnitude)")
title("First order accurate finite difference: \ntan(1) - sec(1)")

hold on
p = plot([-8, -8], [0, 1])
set(p,'Color','red','LineWidth',2)
hold off
axis([-16 -1 0 0.4]);
