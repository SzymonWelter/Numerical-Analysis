function B = GaussJordan(A)
    [~,n] = size(A);
    B = eye(n);
    A = [A B]
    
    for i = 1 : n
        A(i,:) = A(i,:)/A(i,i);
        for j = 1 : n
            if j ~= i
                A(j,:) = A(j,:)- A(j,i) * A(i,:);            
            end 
        end
    end
    B = A(:,n+1:end);   
end

