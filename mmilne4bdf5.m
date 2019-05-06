function[t,x] = mmilne4bdf5(f,intervalo,x0,N)

%Inicializacion con RK4
h = (intervalo(2) - intervalo(1))/N;
t(1) = intervalo(1);
x(1,:) = x0;
faux = zeros(6, size(x,2));
faux(1,:) = f(t(1), x(1,:)).';

for i = 2:5
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

for i = 1:N-4
    t(i+5) = t(1) + (i+4)*h;
    %Predicción: milne4    
    x(i+5,:) = x(i+1,:) + 4*h/3*(2*faux(4,:) - faux(3,:) + 2*faux(2,:));
    %Evaluación
    faux(6,:) = f(t(i+5), x(i+5,:));
    %Corrección: BDF5
    x(i+5,:) = 1/137*(300*x(i+4,:) - 300*x(i+3,:) + 200*x(i+2,:) - 75*x(i+1,:) + 12*x(i,:) + 60*h*faux(6,:));
        
    faux(1,:) = faux(2,:);
    faux(2,:) = faux(3,:);
    faux(3,:) = faux(4,:);
    faux(4,:) = faux(5,:);
    faux(5,:) = f(t(i+5),x(i+5,:)).';
end