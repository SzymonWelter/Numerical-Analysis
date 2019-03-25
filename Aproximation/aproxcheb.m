function a = aproxcheb(data, deg,f)
    deg = deg + 1;
    maxx = max(data(:, 1));
    minx = min(data(:, 1));
    data(:, 1) = (2*data(:, 1)-maxx-minx)/(maxx-minx);
    x = zeros(deg,deg);
    y = zeros(1,deg);

    for i = 1 : deg
        y(i) = sum(data(:,2).*(funonrow(data(:,1),f{i})));
        for j = 1 : deg
            x(i,j) =sum(funonrow(data(:,1),f{i}).*funonrow(data(:,1),f{j}));
        end
    end
    a = y/x;
    
end