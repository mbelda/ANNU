function[t,x] = mmilne(f,intervalo,x0,N)
nPasos=4;
h = (intervalo(2) - intervalo(1))/N;
x(1,:) = x0;
t(1) = intervalo(1);
faux = zeros(3, size(x,2));
for i = 2:nPasos
    t(i) = t(1) + (i-1)*h;
    faux(i-1,:) = f(t(i-1), x(i-1,:)).';
    F1 = faux(i-1).';
    F2 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F1.');
    F3 = f(t(i-1) + 3*h/4, x(i-1,:)+ 3*h/4*F1.');
    x(i,:) = x(i-1,:) + h/9*(4*F3 + 3*F2 + 2*F1).';
    if i > 2
        faux(i-1,:) = faux(i-2,:);
    end
end

for i = 1:N-3
    t(i+4) = t(1) + (i+3)*h;
    x(i+4,:) = x(i,:) + 4*h/3*(2*faux(3,:)-faux(2,:)+2*faux(1,:));
    faux(1,:) = faux(2,:);
    faux(2,:) = faux(3,:);
    faux(3,:) = f(t(i+4),x(i+4,:)).';
end