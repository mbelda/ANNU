function[t,x] = mrk4(f,intervalo,x0,N)
%Inicializamos x0 y t0
x(1,:) = x0;
t(1) = intervalo(1);
% Denotamos h el paso 
h = (intervalo(2) - intervalo(1))/N;
for i = 2:N+1
    %ti = t0 + i
    t(i) = t(1) + i*h; 
    %F1 = f(ti,xi)
    F1 = f(t(i-1), x(i-1,:));
    %F2 = f(ti + h/2, xi + h/2*F1)
    F2 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F1.');
    %F3
    F3 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F2.');
    %F4
    F4 = f(t(i-1) + h, x(i-1,:)+ h*F3.');
    %xi+1 = xi + h/2*(F1+F2)
    x(i,:) = x(i-1,:) + h/6*(F4 + 2*F3 + 2*F2 + F1).';
    
end
