function[t,x] = mab3am3(f,intervalo,x0,N)

%Inicializacion con RK3
h = (intervalo(2) - intervalo(1))/N;
t(1) = intervalo(1);
x(1,:) = x0;
faux = zeros(3, size(x,2));
faux(1,:) = f(t(1), x(1,:)).';

for i = 2:3
    %ti = t1 + (i-1)*h
    t(i) = t(1) + (i-1)*h; 
    %F1 = f(ti,xi)
    F1 = faux(i-1,:);
    %F2 = f(ti + h/2, xi + h/2*F1)
    F2 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F1).';
    %F3
    F3 = f(t(i-1) + 3*h/4, x(i-1,:)+ 3*h/4*F1).';
    %xi+1 = xi + h/2*(F1+F2)
    x(i,:) = x(i-1,:) + h/9*(4*F3 + 3*F2 + 2*F1);
    
    faux(i,:) = f(t(i), x(i,:)).';    
end

for i = 1:N-2
    t(i+3) = t(1) + (i+2)*h;
    %Predicción: ab3    
    x(i+3,:) = x(i+2,:) + h/12*(23*faux(3,:) - 16*faux(2,:) + 5*faux(1,:));
    %Evaluación
    faux(4,:) = f(t(i+3),x(i+3,:));
    %Corrección: am3
    x(i+3,:) = x(i+2,:) + h/24*(9*faux(4,:) + 19*faux(3,:) - 5*faux(2,:) + faux(1,:));
        
    faux(1,:) = faux(2,:);
    faux(2,:) = faux(3,:);
    faux(3,:) = f(t(i+3),x(i+3,:)).';
end