function pol = polybase(i)
    pol = cell(1,i);
    for j = 1 : i
        pol{j} = @(x) x^(j-1);
    end
end