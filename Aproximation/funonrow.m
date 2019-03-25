function newrow = funonrow(xrow, fun)
    [s,~] = size(xrow);
    newrow = zeros(s,1);
    for i = 1 : s
        newrow(i) = fun(xrow(i));
    end
end