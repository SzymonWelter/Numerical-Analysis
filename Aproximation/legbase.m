function leg = legbase(i)
    leg = cell(1,i);
    leg{1} = @(x) 1;
    leg{2} = @(x) x;
    for j = 3 : i
        f = leg{j-1};
        g = leg{j-2};
        leg{j} = @(x) ((2*(j-2)+1)/(j-1)) * x * f(x) - ((j-2)/(j-1)) * g(x);
    end
end