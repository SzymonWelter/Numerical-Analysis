function result = ComplexNewtonCotes(fi,h,d)
    result = 0;
    n = length(fi);
    last = mod(n-1, d) + d;
    for i = 1 : d : n - last
        result = result + SimpleNewtonCotes(fi(i : i+d), h);
    end
    if last ~= d
        result = result + SimpleNewtonCotes(fi(n-last+d : n), h);
    end
    
end