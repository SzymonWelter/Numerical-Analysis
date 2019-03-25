function plotaprox(data, basefun, deg)
    scatter(data(:,1), data(:,2), "b");
    hold on
    grid on
    minx=min(data(:,1));
    maxx=max(data(:,1));
    x = linspace(minx,maxx);
    if basefun == "poly"
        a = aproxpol(data, deg);        
        plot(x,createfun(x,a,polybase(2*deg-1)));
    elseif basefun == "cheb"
        f = chebbase(2*deg-1);
        a = aproxcheb(data, deg, f);
        plot(x,createfun((2*x-maxx-minx)/(maxx-minx),a,f));
    else
        return
    end       
end