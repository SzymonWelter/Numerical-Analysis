function cheb = chebbase(i)
    cheb = cell(1,i);
    cheb{1} = @(x) 1;
    cheb{2} = @(x) x;
    for j = 3 : i
        f = cheb{j-1};
        g = cheb{j-2};
        cheb{j} = @(x) 2 * x * f(x) - g(x);
    end
end