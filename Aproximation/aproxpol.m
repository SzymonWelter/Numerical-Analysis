function a = aproxpol(data, deg)
    deg = deg + 1;
    x = zeros(deg,deg);
    xrow = zeros(2*deg-1);
    y = zeros(1,deg);
    for i = 1 : 2 * deg-1
        xrow(i) = sum(data(:,1).^(i-1));
    end
    for i = 1 : deg
        y(i) = sum(data(:,2).*(data(:,1).^(i-1)));
        x(i, :) = xrow(i:(deg+i-1));
    end
    a = y/x;
end