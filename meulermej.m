function[t,x] = meulermej(f,intervalo,x0,N)
%Inicializamos x0 y t0
x(1,:) = x0;
t(1) = intervalo(1);
% Denotamos h el paso 
h = (intervalo(2) - intervalo(1))/N;
for i = 2:N+1
    %ti = t0 + i
    t(i) = t(1) + (i-1)*h; 
    %F1 = f(ti,xi)
    F1 = f(t(i-1), x(i-1,:));
    %F2 = f(ti+1, xi + h*F1)
    F2 = f(t(i), x(i-1,:)+ h*F1.');
    %xi+1 = xi + h/2*(F1+F2)
    x(i,:) = x(i-1,:) + h/2*(F2 + F1).';
    
    % Necesitamos trasponer la f porque es una columna mientras que la x es
    % una fila
end
