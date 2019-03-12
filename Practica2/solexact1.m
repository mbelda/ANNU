function [m] = solexact1(t)
%f1=@(t,x) [-0.1*x(1)+ 2*x(2);-2*x(1)-0.1*x(2)]; intervalo1=[0,10]; x01 = [0,1];
sol1=@(t) [exp(-0.1*t)*sin(2*t);exp(-0.1*t)*cos(2*t)];
%f2=@(t,x) [x(2);-2*x(1)+cos(3*t)]; intervalo2 = [0,10]; x02 = [1,0];
sol2=@(t) [8/7*cos(sqrt(2)*t)-1/7*cos(3*t)];

rowt = size(t,1);
for i=1:rowt
   m(i,1)=0;
   m(i,2)=sol2(t(i));
end

end