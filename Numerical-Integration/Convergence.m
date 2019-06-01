
i = 1000;
f = @(x)11*x^10;

for d = 1 : 4
    n = (d-1)*(i+1)
    for j = 1 : n
       fi(j) = f(j*h) 
    end
    h = 4/(n-1);
    result_nc(d) = ComplexNewtonCotes(fi,h,d);
end

grid on
loglog([1:1000], abs(result_nc(1)-2.0));
loglog([1:1000], abs(result_nc(2)-2.0));
loglog([1:1000], abs(result_nc(3)-2.0));
loglog([1:1000], abs(result_nc(4)-2.0));
