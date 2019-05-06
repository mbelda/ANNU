
% x es la matriz solucion
% su numero de columnas nos dice de cuantas dimensiones es el problema
% if length(x(1,:)) == 1
%     figure(1)
%     plot(t,x(:,1),'r')
% elseif length(x(1,:)) == 2
%     figure(1)
%     subplot(2,1,1);
%     plot(t,x(:,1),'r')
%     legend('Comp X1')
%     subplot(2,1,2);
%     plot(t,x(:,2),'g')
%     legend('Comp X2')
%     figure(2);
%     plot(x(:,1),x(:,2),'r')
% elseif length(x(1,:)) == 3
%     figure(1)
%     subplot(3,1,1);
%     plot(t,x(:,1),'r')
%     legend('Comp X1')
%     subplot(3,1,2);
%     plot(t,x(:,2),'g')
%     legend('Comp X2')
%     subplot(3,1,3)
%     plot(t,x(:,3),'b')
%     legend('Comp X3')
%     figure(2);
%     plot(x(:,1),x(:,2),'r')
% end
%     
colx=size(x,2); % Numero de columnas de la matriz x
color=['r' 'g' 'b'];
figure(1)
for i=1:colx 
  subplot(colx,1,i)
  plot(t,x(:,i),color(i))
  s=sprintf('Coordenada %d de la solucion',i);
  title(s)
end
if colx>1
  pause(3) 
  figure(2)
  if colx==2
      plot(x(:,1),x(:,2),'r')
      %comet(x(:,1),x(:,2))
  else
      %plot3(x(:,1),x(:,2),x(:,3),'r')
      comet3(x(:,1),x(:,2),x(:,3))
  end
title('Trayectoria de la solucion')
end
