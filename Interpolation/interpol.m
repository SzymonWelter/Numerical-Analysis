function y = interpol(func, interpolMethod, first, last ,nodeNum, nodeMethod)
    
    xn = nodeMethod(first,last,nodeNum);
    yn = 1 : nodeNum;
    for i = 1 : nodeNum
        yn(i) = func(xn(i));
    end
    
    x = linspace(first,last,1000);
    y = 1:1000;
    
    for i = 1 : 1000
        y(i) = interpolMethod(xn,yn,x(i));
    end       
end
