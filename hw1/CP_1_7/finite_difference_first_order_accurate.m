function v = finite_difference_first_order_accurate(func, x, h)
    v = (func(x + h) - func(x)) ./ h;
end
