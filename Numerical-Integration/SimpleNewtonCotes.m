function result = SimpleNewtonCotes ( fi, h )
    n = length(fi);
    switch n
        case 1
            result = fi(1) * h;
            return
        case 2
            sig = [1, 1];
            ns = 2;
        case 3
            sig = [1, 4, 1];
            ns = 6;
        case 4
            sig = [1, 3, 3, 1];
            ns = 8;
        case 5
            sig = [7, 32, 12, 32, 7];
            ns = 90;
        otherwise
            result = NaN;
            return;
    end
    result = 0;
    for i = 1 : n
        result = result + sig(i) * fi(i);
    end    
    result = (h * (n-1) / ns) * result ;
end
