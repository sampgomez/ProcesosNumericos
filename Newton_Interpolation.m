format long
% x= [0 0.4000 0.8000 1.2000 1.6000 2.0000 2.4000 3.2000 3.6000 4.0000]';
% y= [0 0.0621 0.1797 0.2635 0.2783 0.2414 0.1932 0.1667 0.1852 0.2038]';

    x=input('Ingrese los valores del vector x: ');
    y=input('Ingrese los valores del vector y: ');
    n=length(x);
    Tabla=zeros(n,n+1);
    Tabla(:,1)=x;
    Tabla(:,2)=y;
    for j=3:n+1
        for i=j-1:n
            Tabla(i,j)=(Tabla(i,j-1)-Tabla(i-1,j-1))/(Tabla(i,1)-Tabla(i-j+2,1));
        end
    end


Tabla(:,1) = [];
coef=diag(Tabla)'

    n=length(x);
    pol=1;
    acum=pol;
    pol=coef(1)*acum;
    for i=1:n-1
        pol=[0 pol];
        acum=conv(acum,[1 -x(i)]);
        pol=pol+coef(i+1)*acum;
    end
pol
L=pol;
  xpol=x(1):0.001:x(end);
p=L(1)*xpol.^9 +L(2)*xpol.^8 +L(3)*xpol.^7 +L(4)*xpol.^6 +L(5)*xpol.^5 +L(6)*xpol.^4 +L(7)*xpol.^3 +L(8)*xpol.^2 +L(9)*xpol.^1 +L(10);

xu= input('Ingrese el valor adicional ');
pu= L(1)*xu^9 +L(2)*xu^8 +L(3)*xu^7 +L(4)*xu^6 +L(5)*xu^5 +L(6)*xu^4 +L(7)*xu^3 +L(8)*xu^2 +L(9)*xu^1 +L(10)
figure

plot(xpol,p,'r',xu,pu,'b*')
xlabel('t (s)') 
ylabel('Angular Position (rad)')

