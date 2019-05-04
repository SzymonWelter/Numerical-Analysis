function [result,err] = NewtonRaphson(f,df,x0,n,eps)
    err = zeros(1, n);
    err(1) = abs(f(x0));
    result = x0;
    i = 1;
    while abs(f(result)) > eps && i <=n
        result = result- f(result)/df(result);
        i = i+1;
        err(i) = abs(f(result));
    end
    err = err(1,1:i);
end