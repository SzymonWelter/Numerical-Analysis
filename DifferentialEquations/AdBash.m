function res = AdBash(x, y, p, q, fun)
    res = 0;
    beta = [1 0 0 0 0;
            3/2 -1/2 0 0 0;
            23/12 -16/12 5/12 0 0;
            55/24 -59/24 37/24 -9/24 0;
            1901/720 -2774/720 2616/720 -1274/720 251/720;];
    for i = 0 : q
        res = res + beta(q+1,i+1)*fun(x(p-i),y(p-i));
    end
end