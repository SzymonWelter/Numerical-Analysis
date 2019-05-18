function result = ComplexNewtonCotes(fi,h,d)
    result = 0;
    n = length(fi);
    last = mod(n-1, d);
    for i = 1 : d : n - last - d
        result = result + SimpleNewtonCotes(fi(i : i+d), h);
    end
    if last ~= 0
        result = result + SimpleNewtonCotes(fi(n-last : n), h);
    end
    
end