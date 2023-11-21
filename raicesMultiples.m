% Metodo de Raices Multiples: Ingresa la funcion f(x), su derivada
% f'(x), el valor inicial (x0), la tolerancia del error (tol) y el numero
% de iteraciones deseado (iter).

function [val] = raicesMultiples

format long

syms x

f=input('Ingrese la función: ');
%fp=input('Ingrese la derivada de la función: ');
tol=input('Ingrese la tolerancia deseada: ');
iter=input('Ingrese el máximo numero de iteraciones deseadas: ');
x0=input('Ingrese el valor inicial (x0): ');

fp=diff(f,x);

fplot(f), grid on
grid on
xlim([115 125])
title('Multiple Roots Graph')
   
fx=eval(subs(f,x0));
dfx=eval(subs(fp,x0));

if fx==0
    s=x0;
    E=0;
    fprintf('%f es raiz de la funcion f(x)',x0)

else
    c=0;
    xn=x0;
    fn=eval(subs(f,xn));
    dfn=eval(subs(fp,xn));
    n(c+1)=c;
    E(c+1)=tol+1;
    error=E(c+1);

    while error>tol && fn~=0 && dfn~=0 && c<iter
        xn1=xn-(fn/dfn);
        fn1=eval(subs(f,xn1));
        dfn1=eval(subs(fp,xn1));
        
        %Decimales correctos
        E(c+2)=abs(xn1-xn);
        
        %Cifras significativas
        %E(c+2)=abs((xn1-xn)/xn1);
        
        error=E(c+2);

        xnew(c+2)=xn1;
        fnew(c+2)=fn1;

        xn=xn1;
        fn=fn1;
        dfn=dfn1;
        c=c+1;
        n(c+1)=c;
    end
    
    if fn==0
       s=xn;
       fprintf('%f es raiz de la funcion f(x)',xn) 
    
    elseif error<tol
       s=xn;
       fprintf('%f es la aproximacion de una raiz para la funcion f(x) con tolerancia de %f',xn,tol)
    
    elseif dfn==0
       s=xn;
       fprintf('%f puede ser una raiz multiple',xn)
    
    else 
       s=xn;
       fprintf('Fracaso en %d iteraciones',iter) 
    end
    
end    

var_names={'n','xn','fxn','Error'};
val=table(n',xnew',fnew',E','VariableNames',var_names);

end