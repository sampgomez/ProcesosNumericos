format long
% x= [0 0.4000 0.8000 1.2000 1.6000 2.0000 2.4000 3.2000 3.6000 4.0000]';
% y= [0 0.0621 0.1797 0.2635 0.2783 0.2414 0.1932 0.1667 0.1852 0.2038]';

x = input('Enter the values for the vector x transpose: '); % x coordinates of known points
y = input('Enter the values for the vector y transpose: '); % y coordinates of known points


    n=length(x);
    Tabla=zeros(n,n);
    for i=1:n
        Li=1;
        den=1;
        for j=1:n
            if j~=i
                paux=[1 -x(j)];
                Li=conv(Li,paux);
                den=den*(x(i)-x(j));
            end
        end
        Tabla(i,:)=y(i)*Li/den;
    end
    L=sum(Tabla)
  xpol=x(1):0.001:x(end);
p=L(1)*xpol.^9 +L(2)*xpol.^8 +L(3)*xpol.^7 +L(4)*xpol.^6 +L(5)*xpol.^5 +L(6)*xpol.^4 +L(7)*xpol.^3 +L(8)*xpol.^2 +L(9)*xpol.^1 +L(10);

xu= input('Enter the additional value ');
pu= L(1)*xu^9 +L(2)*xu^8 +L(3)*xu^7 +L(4)*xu^6 +L(5)*xu^5 +L(6)*xu^4 +L(7)*xu^3 +L(8)*xu^2 +L(9)*xu^1 +L(10)
figure

plot(xpol,p,'r',xu,pu,'b*')
xlabel('t (s)') 
ylabel('Angular Position (rad)')

