function v = finite_difference_second_order_accurate(func, x, h)
    v = (func(x + h) - func(x - h)) ./ (2*h);
end

