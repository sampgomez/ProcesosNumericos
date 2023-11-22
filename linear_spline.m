format long
% x= [0 0.4000 0.8000 1.2000 1.6000 2.0000 2.4000 3.2000 3.6000 4.0000]';
% y= [0 0.0621 0.1797 0.2635 0.2783 0.2414 0.1932 0.1667 0.1852 0.2038]';

x = input('Enter the values for the vector x transpose: '); % x coordinates of known points
y = input('Enter the values for the vector y transpose: '); % y coordinates of known points

% The user enters the values of x and y as transposed vectors

[coeficientes] = Spline(x, y, 1);

% Coefficients of the linear spline are calculated by calling the "Spline" function with the vectors x and y and an additional parameter of 1

xpol1=x(1):0.001:x(2);
xpol2=x(2):0.001:x(3);
xpol3=x(3):0.001:x(4);
xpol4=x(4):0.001:x(5);
xpol5=x(5):0.001:x(6);
xpol6=x(6):0.001:x(7);
xpol7=x(7):0.001:x(8);
xpol8=x(8):0.001:x(9);
xpol9=x(9):0.001:x(10);

% Values of x at which the interpolation polynomials will be evaluated are defined

p1 = coeficientes(1, 1) * xpol1 + coeficientes(1, 2);
p2 = coeficientes(2, 1) * xpol2 + coeficientes(2, 2);
p3 = coeficientes(3, 1) * xpol3 + coeficientes(3, 2);
p4 = coeficientes(4, 1) * xpol4 + coeficientes(4, 2);
p5 = coeficientes(5, 1) * xpol5 + coeficientes(5, 2);
p6 = coeficientes(6, 1) * xpol6 + coeficientes(6, 2);
p7 = coeficientes(7, 1) * xpol7 + coeficientes(7, 2);
p8 = coeficientes(8, 1) * xpol8 + coeficientes(8, 2);
p9 = coeficientes(9, 1) * xpol9 + coeficientes(9, 2);

% Calculation of the values of the interpolation polynomials

disp('interpolating polynomials:')
disp(['P1: ', num2str(coeficientes(1,1)), '* x + ', num2str(coeficientes(1,2))])
disp(['P2: ', num2str(coeficientes(2,1)), '* x + ', num2str(coeficientes(2,2))])
disp(['P3: ', num2str(coeficientes(3,1)), '* x + ', num2str(coeficientes(3,2))])
disp(['P4: ', num2str(coeficientes(4,1)), '* x + ', num2str(coeficientes(4,2))])
disp(['P5: ', num2str(coeficientes(5,1)), '* x + ', num2str(coeficientes(5,2))])
disp(['P6: ', num2str(coeficientes(6,1)), '* x + ', num2str(coeficientes(6,2))])
disp(['P7: ', num2str(coeficientes(7,1)), '* x + ', num2str(coeficientes(7,2))])
disp(['P8: ', num2str(coeficientes(8,1)), '* x + ', num2str(coeficientes(8,2))])
disp(['P9: ', num2str(coeficientes(9,1)), '* x + ', num2str(coeficientes(9,2))])

% Printing the interpolation polynomials to the console

x_extra = input('Enter the value for the additional point: ');
% Point to interpolate

y_extra = interp1(x, y, x_extra, 'linear');
% Interpolation with linear spline

fprintf('Interpolated point: (%.4f, %.4f)\n', x_extra, y_extra);
% Display results

figure;
plot(x, y, 'b*-', xpol1, p1, 'b', xpol2, p2, 'b', xpol3, p3, 'b', xpol4, p4, 'b',xpol5, p5, 'b',xpol6, p6, 'b', xpol7, p7, 'b', xpol8, p8, 'b', xpol9, p9, 'b', x_extra, y_extra, 'r*');
title('Interpolation with Linear Spline');
xlabel('Time (s)');
ylabel('Angular Position (rad)');
grid on;
% Plot of known points and the interpolated point
