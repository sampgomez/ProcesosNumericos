%MatJacobiSeid: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método de Jacobi o
%de Gauss Seidel (Matricial), depende del método elegido, se elige 0 o 1 en met
%respectivamente

function [TablaDatos] = Jacobi_Gauss()
    format long

    %Matrices a resolver
    % A = [6.36   0      0      0      0   -2.36; 0     5.95  -2.35    0      0    2.6; 0    -2.35  12.69   -5      0     0; 0      0      -5   14.02  -6.8    0;0      0       0   -6.8    10.3   0; -2.36   2.6     0     0      0    6.96];

    % b = [24;24;0;0;0; 0];

    % x0 = [1;1;1;1;1;1];
    
    %Valores establecidos por usuario
    A= input('Enter the A matrix: ');
    b= input('Enter the b vector: ');
    x0= input('Enter the inital values x0: ')
    Tol = input('Enter the value of tolerance');
    Niter = input('Enter the number of iterations ');
    met = input('Enter the method (Jacobi = 0 / Gauss = 1): ');

    %Parámetros para el while
    cont = 0;
    Error = Tol+1;
    
    %Matrices para el cálculo
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A,+1);
    
    E = [];
    iter = [];
    Var1 = [];
    Var2 = [];
    Var3 = [];
    Var4 = [];
    Var5 = [];
    Var6 = [];

    while Error>Tol && cont<Niter
        %Jacobi
        if met==0
            T=inv(D)*(L+U);
            C=inv(D)*b;
            x1=T*x0+C;
            radioE = max(abs(eig(T)));
            if radioE >= 1
                disp('Es posible que no se dé convergencia')
            end
        end
        
        %Gauss Seidel
        if met==1
            T=inv(D-L)*(U);
            C=inv(D-L)*b;
            x1=T*x0+C;
            radioE = max(abs(eig(T)));
            if radioE >= 1
                disp('Es posible que no se dé convergencia')
            end
        end

        E(cont+1) = Error;

        %Decimales correctos (0.5e-k)
        Error = norm(x1-x0,'inf');
        
        %Cifras significativas (5e-k)
        %Error = norm(x1-x0,'inf')/norm(x1,'inf');

        Var1(cont+1) = x0(1,1);
        Var2(cont+1) = x0(2,1);
        Var3(cont+1) = x0(3,1);
        Var4(cont+1) = x0(4,1);
        Var5(cont+1) = x0(5,1);
        Var6(cont+1) = x0(6,1);
        iter(cont+1) = cont;

        x0 = x1;
        cont = cont+1;
    end

    E(cont+1) = Error;
    Var1(cont+1) = x0(1,1);
    Var2(cont+1) = x0(2,1);
    Var3(cont+1) = x0(3,1);
    Var4(cont+1) = x0(4,1);
    Var5(cont+1) = x0(5,1);
    Var6(cont+1) = x0(6,1);
    iter(cont+1) = cont;

    TablaDatos = table(iter',Var1',Var2',Var3',Var4',Var5',Var6',E');
    ColumnTitle = {'N','X1','X2','X3','X4','X5','X6','Error'};
    TablaDatos.Properties.VariableNames = ColumnTitle;

    if Error < Tol
        fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
    else 
        fprintf('Fracasó en %f iteraciones',Niter) 
    end
end


