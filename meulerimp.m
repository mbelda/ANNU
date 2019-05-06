function[t,x] = meulerimp(f,intervalo,x0,N)
%Inicializamos con euler explicito
h = (intervalo(2) - intervalo(1))/N;
t(1) = intervalo(1);
x(1,:) = x0;
faux = zeros(1, size(x,2));
faux(1,:) = f(t(1), x(1,:)).';

for i = 1:N+1
    t(i+1) = t(1) + i*h;
    x(i+1,:) = x(i,:) + h*faux(1,:);
    faux(1,:) = f(t(i+1), x(i+1,:)).';
    x(i+1,:) = x(i,:) + h*faux(1,:);
    faux(1,:) = f(t(i+1), x(i+1,:)).';
end