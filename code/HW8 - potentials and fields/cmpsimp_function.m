function integral = cmpsimp(a,b,n,f)
h = (b-a)/n;
xi0 = feval(’f’,a)+feval(’f’,b);
xi1 = 0;
xi2 = 0;
for i = 1:n-1
x = a+i*h;
if mod(i,2) == 0
xi2 = xi2+feval(’f’,x);
else
xi1 = xi1+feval(’f’,x);
end
end
xi = h*(xi0+2*xi2+4*xi1)/3;