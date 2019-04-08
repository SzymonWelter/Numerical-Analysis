function [x, r, err] = RLU(A, b)
    [~,n] = size(A);
    L = zeros(n);
    U = zeros(n);
    for i = 1 : n
        L(i,i) = 1;
    end
    U(1, :) = A(1, :);
    L(2 : n, 1) = A(2 : n, 1)/U(1,1);
    
    for i = 2 : n
        for j = i : n
            lres = 0;
            ures = 0;
            for k = 1 : i-1
                lres = lres + L(j,k) * U(k,i);
                ures = ures + L(i,k) * U(k,j);
            end
            U(i,j) = A(i, j) - ures;
            L(j,i) = (A(j,i) - lres)/(U(i,i));
        end
    end
    y = zeros(n,1);
    y(1) = b(1);
    for i = 1 : n
        res = 0;
        for j = 1 : i-1
            res = res + L(i,j)*y(j);
        end
        y(i) = (b(i) - res)/L(i,i);
    end
    
    x(n) = y(n)/U(n,n);
    for i = n-1 : -1 : 1
        res = 0;
        for j = i+1 : n
            res = res + U(i,j)*x(j);
        end
        x(i) = (y(i) - res)/U(i,i);
    end
    r = abs(A * rot90(x,3) - b);
    err = abs(A-L * U);
end
