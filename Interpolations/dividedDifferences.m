function a = dividedDifferences( xn, yn )
    a = yn;
    [~,s] = size(yn);
    for i = 1 : s 
        for j = s : -1 : i+1
            a(j)=(a(j)-a(j-1))/(xn(j)-xn(j-i));
        end
    end
end
