mu = 50;
f = @(t,x) [-mu*(x(1) - cos(t))];
intervalo = [0, 1];
x0 = [0];
N = [24, 26];
figure(1);
hold on;
[t,x] = meuler(f, intervalo, x0, N(1));
plot(t, x, 'black');
[t,x1] = ode45(f, t, x0);
plot(t, x1, 'blue');
legend('Euler','ode45');
title(N(1));
figure(2);
hold on;
[t,x] = meuler(f, intervalo, x0, N(2));
plot(t, x, 'red');
[t,x1] = ode45(f, t, x0);
plot(t, x1, 'green');
legend('Euler','ode45');
title(N(2));



