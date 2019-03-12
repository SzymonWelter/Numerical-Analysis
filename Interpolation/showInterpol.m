function showInterpol(func, interpolMethod, first, last, nodeNum, nodesMethod)
    yint = zeros(3, 1000);
    
    for i = 1:3
        yint(i,:) = interpol(func, interpolMethod, first, last, nodeNum(i), nodesMethod);
    end
    x=linspace(first,last,1000);
    y=1:1000;
    for i=1:1000
        y(i)=func(x(i));
    end
    
    avrer = zeros(1,3);
    maxer = zeros(1,3);
    
    for i = 1 : 3
        for j = 1 : 1000
            e = abs(y(j) - yint(i,j));
            avrer(i) = avrer(i) + e;
            maxer(i) = max([maxer(i),e]);
        end
        avrer(i) = avrer(i) / 1000;
        disp(["Average error: ", string(avrer(i)),", max error: ", string(maxer(i)),", ", string(nodeNum(i)), " interpolation nodes"]);
    end        
    plot(x, yint(1,:), x, yint(2,:), x, yint(3,:), x, y, "k--");
    grid on
    if isequal(interpolMethod, @lagrange)
        title("Interpolation by Lagrange Polynomials");        
    elseif isequal(interpolMethod, @newton) 
        title("Interpolation by Newton Polynomials");
    end
    str = string(1 : 4);
    for i = 1 : 3
        str(i) = strcat(string(nodeNum(i))," nodes");
    end
    str(4) = "reference";
    legendinfo("Node number");
    legend(str);
    if isequal(nodesMethod, @linspace)
        xlabel("Linspace nodes");
    elseif isequal(nodesMethod, @chebNodes)
        xlabel("Chebyshev nodes");
    end 
end 
