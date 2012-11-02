function r = bisection(f, a, b, tol)
	while((b-a) > tol)
		m = a + (b-a)/2.0;
		if(sign(f(a)) != sign(f(m)))
			b = m;
		else
			a = m;
		end
	end
	r = a + (b-a)/2.0;
end
