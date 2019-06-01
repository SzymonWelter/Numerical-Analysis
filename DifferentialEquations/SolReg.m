function [x,y] = SolReg(funx, funy, s, e, h, x0, y0, method)

    if method == "euler"
        fix = funx;
        fiy = funy; 
    elseif method == "heun"
        fix = @(x,y) (funx(x,y)+funx(x+h, y+h*funx(x,y)))/2;
        fiy = @(x,y) (funy(x,y)+funy(x+h, y+h*funy(x,y)))/2;
    else
        disp("Method " + string(method) + " is undefined.");
        return;
    end
    
    t=s:h:e;
    [~,n] = size(t);
    x=zeros(1,n);
    x(1)=x0;
    y=zeros(1,n);
    y(1)=y0;

    for i = 1 : n-1
        x(i+1) = x(i) + h * fix(y(i),x(i));
        y(i+1) = y(i) + h * fiy(x(i),y(i));        
    end
end