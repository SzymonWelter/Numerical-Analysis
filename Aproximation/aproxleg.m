function a = aproxleg(data, deg,f)
    deg = deg + 1;
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