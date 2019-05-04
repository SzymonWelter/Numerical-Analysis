function [avr,err] = BiSection(f, a, b, n, eps)
    avr = (a+b)/2;
    err = zeros(1, n);
    err(1) = abs(f(avr));
    
    i = 1;
    while abs(f(avr)) > eps && i <= n
       avr = (a+b)/2;
       if f(a) * f(avr) > 0
           a = avr;
       else
           b = avr;           
       end
       err(i) = abs(f(avr));
       i = i+1;
    end
    err = err(1,1:i-1);
end

