function N = newton(xs, ys, x, divDiff)
    N = ys(1);
    [~,k] = size(xs);
    w = 1;
    for j = 2 : k
        w = w * (x - xs(j-1));  
        N = w * divDiff(j)+ N;
    end
end