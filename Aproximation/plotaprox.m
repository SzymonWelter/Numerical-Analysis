function plotaprox(data, basefun, deg)
    scatter(data(:,1), data(:,2), "b");
    hold on
    grid on
    minx=min(data(:,1));
    maxx=max(data(:,1));
    x = linspace(minx,maxx);
    if basefun == "poly"
        a = aproxpol(data, deg);        
        plot(x,createfun(x,a,polybase(deg+1)));
    elseif basefun == "cheb"
        f = chebbase(deg+1);
        a = aproxcheb(data, deg, f);
        plot(x,createfun((2*x-maxx-minx)/(maxx-minx),a,f));
    elseif basefun == "legb"
        f = legbase(deg+1);
        a =aproxleg(data, deg, f);
        plot(x,createfun(x,a,f));
    else
        return
    end 
end