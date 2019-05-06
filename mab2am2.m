function[t,x] = mab2am2(f,intervalo,x0,N)

%Inicializacion con Euler mejorado
h = (intervalo(2) - intervalo(1))/N;
t(1) = intervalo(1);
x(1,:) = x0;
faux = zeros(4, size(x,2));
faux(1,:) = f(t(1), x(1,:)).';
t(2) = t(1) + h;
x(2,:) = x(1,:) + h/2*(faux(1,:) + f(t(2), x(1,:) + h*faux(1,:)).');
faux(2,:) = f(t(2),x(2,:)).';

for i = 1:N-1
    t(i+2) = t(1) + (i+1)*h;
    %Predicción: ab2    
    x(i+2,:) = x(i+1,:) + h/2*(3*faux(2,:)-faux(1,:));
    %Evaluación
    faux(3,:) = f(t(i+2),x(i+2,:));
    %Corrección: am2
    x(i+2,:) = x(i+1,:) + h/12*(5*faux(3,:)+8*faux(2,:)-faux(1,:));
        
    faux(1,:) = faux(2,:);
    faux(2,:) = f(t(i+2),x(i+2,:)).';
end