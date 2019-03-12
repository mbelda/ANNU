%%% FUNCION 1b %%%
% f = @(t,x) [x(2);-x(1)-(x(1)^2-1)*x(2)]; intervalo = [0,10]; x0 = [1,0]; N = 1000;

%%% OSCILADOR %%%
% k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;

%%% VAN DER POL %%%
% f=@(t,x) [x(2);-x(1)-(x(1)^2-1)*x(2)]; intervalo=[0,10]; x0=[1,0]; N=1000

%%% FUNCION EJEMPLO (OJITOS) %%%
 f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0 = [0,4]; N=1000;

%%% INVENTO R3%%%
% f=@(t,x) [x(3);-x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0 = [0,0,4]; N=1000;

%%% INVENTO R1%%%
% f=@(t,x) [-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0 = [4]; N=1000;




