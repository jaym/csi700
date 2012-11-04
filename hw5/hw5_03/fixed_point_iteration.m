function x = fixed_point_iteration(f, x_0, max_iteration)
	x = x_0;
	for i = 1:max_iteration
		x = f(x);
	end
end
