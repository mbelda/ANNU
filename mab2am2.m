function[t,x] = mab2am2(f,intervalo,x0,N)
nPasos=2;
h = (intervalo(2) - intervalo(1))/N;
x(1,:) = x0;
t(1) = intervalo(1);
faux = zeros(3, size(x,2));
for i = 2:nPasos
    t(i) = t(1) + i*h;
    faux(i-1,:) = f(t(i-1), x(i-1,:)).';
    F1 = faux(i-1,:);
    F2 = f(t(i), x(i-1,:)+ h*F1).';
    x(i,:) = x(i-1,:) + h/2*(F2 + F1);
end
faux(2,:) = f(t(2),x(2,:)).';

for i = 1:N-(nPasos-1)
    t(i+2) = t(1) + (i+1)*h;
    %Predicción    
    x(i+2,:) = x(i+1,:) + h/2*(3*faux(2,:)-faux(1,:));
    %Evaluación
    faux(3,:) = f(t(i+2),x(i+2,:));
    %Corrección
    x(i+2,:) = x(i+1,:) + h/12*(5*faux(3,:)+8*faux(2,:)-faux(1,:));
    
    
    faux(1,:) = faux(2,:);
    faux(2,:) = faux(3,:);
    faux(3,:) = f(t(i+3),x(i+3,:)).';
end