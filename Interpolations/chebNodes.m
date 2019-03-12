function xn = chebNodes(first, last, nodeNum)
    xn = zeros(1, nodeNum);
    for i = 1 : nodeNum
        xn(i) = ((first+last) + (last-first)*cos((2*i - 1)*pi/(2*nodeNum)))/2;
    end   
end
