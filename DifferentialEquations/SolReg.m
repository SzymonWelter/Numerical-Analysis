function [x,y] = SolReg(funx, funy, s, e, h, x0, y0, method, q)
    t=s:h:e;
    [~,n] = size(t);
    x=zeros(1,n);
    x(1)=x0;
    y=zeros(1,n);
    y(1)=y0;

    if method == "euler"
        fix = funx;
        fiy = funy; 
    elseif method == "heun"
        fix = @(x,y) (funx(x,y)+funx(x+h, y+h*funx(x,y)))/2;
        fiy = @(x,y) (funy(x,y)+funy(x+h, y+h*funy(x,y)))/2;
    elseif method == "Ad-Bash"        
        for i = 1 : q
            x(i+1) = x(i) + h * funx(y(i),x(i));
            y(i+1) = y(i) + h * funy(x(i),y(i));        
        end
        for i = q+1 : n-1
            x(i+1) = x(i) + h * AdBash(y, x, i, q, funx);
            y(i+1) = y(i) + h * AdBash(x, y, i, q, funy);     
        end
        return
    else
        disp("Method " + string(method) + " is undefined.");
        return;
    end
    
    for i = 1 : n-1
        x(i+1) = x(i) + h * fix(y(i),x(i));
        y(i+1) = y(i) + h * fiy(x(i),y(i));     
    end
end