function x = Gauss(A, b)
    [~,n] = size(A);
    x = zeros(1, n);
    for i = 1 : n
        for j = i+1 : n
            d = A(j,i)/A(i,i);
            A(j,:) = A(j,:)- d * A(i,:);
            b(j) = b(j) - d* b(i);
        end
    end
    x(n) = b(n)/A(n,n);
    for i = n-1 : -1 : 1
        res = 0;
        for j = i+1 : n
            res = res + A(i,j)*x(j);
        end
        x(i) = (b(i) - res)/A(i,i);
    end        
end