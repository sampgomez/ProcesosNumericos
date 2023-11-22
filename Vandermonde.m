format long

% x= [0 0.4000 0.8000 1.2000 1.6000 2.0000 2.4000 3.2000 3.6000 4.0000]';
% y= [0 0.0621 0.1797 0.2635 0.2783 0.2414 0.1932 0.1667 0.1852 0.2038]';

x = input('Enter the values for the vector x transpose: '); % x coordinates of known points
y = input('Enter the values for the vector y transpose: '); % y coordinates of known points


A=[x.^12 x.^11 x.^10 x.^9 x.^8 x.^7 x.^6 x.^5 x.^4 x.^3 x.^2 x x.^0];

b=y;
a=inv(A)*b

xpol=x(1):0.001:x(end);
p=a(1)*xpol.^12 +a(2)*xpol.^11 +a(3)*xpol.^10 +a(4)*xpol.^9 +a(5)*xpol.^8 +a(6)*xpol.^7 +a(7)*xpol.^6 +a(8)*xpol.^5 +a(9)*xpol.^4 +a(10)*xpol.^3 +a(11)*xpol.^2 +a(12)*xpol.^1 +a(13);

xu= input('Enter the additional value ');
pu= a(1)*xu^12 +a(2)*xu^11 +a(3)*xu^10 +a(4)*xu^9 +a(5)*xu^8 +a(6)*xu^7 +a(7)*xu^6 +a(8)*xu^5 +a(9)*xu^4 +a(10)*xu^3 +a(11)*xu^2 +a(12)*xu^1 +a(13)

figure
plot(xpol,p,'r',xu,pu,'b*')
xlabel('t (s)') 
ylabel('Angular Position (rad)')



