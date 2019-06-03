for i = 1 : 10001
res(i) = abs(x(i)-xref(i));
end
avr = mean(res);