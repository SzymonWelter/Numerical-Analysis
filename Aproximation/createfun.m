function y = createfun(x, a, f)
    [~,sx] = size(x);
    [~,sa] = size(a);
    y = zeros(1,sx);
    for j = 1 : sx
        for i = 1 : sa
            y(j) = y(j) + a(i)*(f{i}(x(j)));
        end
    end
end