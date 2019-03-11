function lgrInterpol(func, first, last, nodeNum)
    res = zeros(6, 1000);
    
    for i = 1:3
        [x, y] = interpol(func, @(xn,yn,x) lagrange(xn,yn,x), first, last, nodeNum(i));
        res(2*i-1,:) = x;
        res(2*i,:) = y;
    end
    x=linspace(first,last,1000);
    y=1:1000;
    for i=1:1000
        y(i)=func(x(i));
    end
    plot(res(1,:), res(2,:), "g-", res(3,:), res(4,:), "k:", res(5,:), res(6,:), "r--", x, y, "b-.");
    
    grid on 
    title("Interpolation by Lagrange Polynomials");
    legendinfo("Node number");
    legend(string(nodeNum(1)), string(nodeNum(2)), string(nodeNum(3)),"real");
    grid off

end 