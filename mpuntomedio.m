function[t,x] = mpuntomedio(f,intervalo,x0,N)
h = (intervalo(2) - intervalo(1))/N;
a = intervalo(1);
b = intervalo(1) + 2*h;
[t,x] = meuler(f,[a,b],x0,2);
for i = 1:N-1
    t(i+2) = t(1) + (i+1)*h;
    x(i+2,:) = x(i,:) + 2*h*f(t(i+1),x(i+1,:)).';
end
