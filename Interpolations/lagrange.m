function L = lagrange(xn, yn, x)
    L = 0;
    [~, s] = size(xn);
    for i = 1 : s
        temp = 1;
        for  j = 1 : s
           if i ~= j
               temp = temp*((x-xn(j))/(xn(i)-xn(j)));
           end
        end
        L = temp*yn(i) + L;
    end
end
