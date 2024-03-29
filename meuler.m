function[t,x] = meuler(f,intervalo,x0,N)
%Inicializamos x0 y t0
x(1,:) = x0;
t(1) = intervalo(1);
% Denotamos h el paso 
h = (intervalo(2) - intervalo(1))/N;
for i = 2:N+1
    %ti = t0 + i*h
    t(i) = t(1) + (i-1)*h; 
    %xi+1 = xi +h*f(ti,xi)
    x(i,:) = x(i-1,:) + h*f(t(i-1), x(i-1,:)).';
    % Necesitamos trasponer la f porque es una columna mientras que la x es
    % una fila
end