function N = newton(xn, yn, x)
    divDiff = dividedDifferences(xn,yn);
    N = yn(1);
    [~,k] = size(xn);
    w = 1;
    for j = 2 : k
        w = w * (x - xn(j-1));  
        N = w * divDiff(j)+ N;
    end
end