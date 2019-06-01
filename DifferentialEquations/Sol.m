function [x,y] = Sol(fun, s, e, h, y0, method)
    if method == "euler"
        fi = fun;
    elseif method == "heun"
        fi = @(x,y) (fun(x,y)+fun(x+h, y+h*fun(x,y)))/2;
    else
        disp("Method " + string(method) + " is undefined.");
        return;
    end
    
    x=s:h:e;
    [~,n] = size(x);
    y=zeros(1,n);
    y(1)=y0;
     
    for i = 1 : n-1
        y(i+1) = y(i) + h * fi(x(i),y(i));        
    end
end