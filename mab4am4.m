function[t,x] = mab4am4(f,intervalo,x0,N)

%Inicializacion con RK4
h = (intervalo(2) - intervalo(1))/N;
t(1) = intervalo(1);
x(1,:) = x0;
faux = zeros(5, size(x,2));
faux(1,:) = f(t(1), x(1,:)).';

for i = 2:4
    %ti = t0 + i
    t(i) = t(1) + (i-1)*h; 
    %F1 = f(ti,xi) 
    F1 = faux(i-1, :);
    %F2 = f(ti + h/2, xi + h/2*F1)
    F2 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F1).';
    %F3
    F3 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F2).';
    %F4
    F4 = f(t(i-1) + h, x(i-1,:)+ h*F3).';
    %xi+1 = xi + h/2*(F1+F2)
    x(i,:) = x(i-1,:) + h/6*(F4 + 2*F3 + 2*F2 + F1);
    
    faux(i, :) = f(t(i), x(i,:)).';
end

for i = 1:N-3
    t(i+4) = t(1) + (i+3)*h;
    %Predicción: ab4    
    x(i+4,:) = x(i+3,:) + h/24*(55*faux(4,:) - 59*faux(3,:) + 37*faux(2,:) - 9*faux(1,:));
    %Evaluación
    faux(5,:) = f(t(i+4), x(i+4,:));
    %Corrección: am4
    x(i+4,:) = x(i+3,:) + h/720*(251*faux(5,:) + 646*faux(4,:) - 264*faux(3,:) + 106*faux(2,:) -19*faux(1,:));
        
    faux(1,:) = faux(2,:);
    faux(2,:) = faux(3,:);
    faux(3,:) = faux(4,:);
    faux(4,:) = f(t(i+4),x(i+4,:)).';
end