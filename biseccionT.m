%Biseccion: Ingresa la funcion f(x), el valor inicial (xi) y
%final del intervalo (xs), la tolerancia del error (tol) y el numero
%de iteraciones deseado (iter).

function [val] = biseccionT
    
    format long
    
    syms x
    
    f=input('Ingrese la función: ');
    tol=input('Ingrese la tolerancia deseada: ');
    iter=input('Ingrese el máximo numero de iteraciones deseadas: ');
    xi=input('Ingrese el valor inicial del intervalo: ');
    xs=input('Ingrese el valor final del intervalo: ');
    
    fplot(f)
    grid on
    title('Bisection Graph')
    xlim([115 125])
       
    fi=eval(subs(f,xi));
    fs=eval(subs(f,xs));
    
    if fi==0
        %s=xi;
        E=0;
        fprintf('%f es raiz de la funcion f(x)',xi)
    
    elseif fs==0
        %s=xs;
        E=0;
        fprintf('%f es raiz de la funcion f(x)',xs)
    
    elseif fs*fi<0
        c=0;
        xm=(xi+xs)/2;
        xmn=xm(c+1);
        fm(c+1)=eval(subs(f,xm));
        fe=fm(c+1);
        n(c+1)=c;
        E(c+1)=tol+1;
        error=E(c+1);
        
        while error>tol && fe~=0 && c<iter
            
            if fi*fe<0
                xs=xm;
                fs=eval(subs(f,xs));
            
            else
                xi=xm;
                fi=eval(subs(f,xi));
            end
            
            xa=xm;
            xm=(xi+xs)/2;
            xmn(c+2)=xm;
            fm(c+2)=eval(subs(f,xm));
            fe=fm(c+2);

            %Dec. Correctos:
            E(c+2)=abs(xm-xa);

            %Cifras significativas:
            %E(c+2)=abs((xm-xa)/xm);

            error=E(c+2);
            c=c+1;
            n(c+1)=c;
        end
        
        if fe==0
           %s=xm;
           fprintf('%f es raiz de la funcion f(x)',xm) 
        
        elseif error<tol
           %s=xm;
           fprintf('%f es la aproximacion de una raiz para la funcion f(x) con tolerancia de %f',xm,tol)
        
        else 
           %s=xm;
           fprintf('Fracaso en %d iteraciones',iter) 
        end
        
    else
       fprintf('El intervalo utilizado no es adecuado o valido')         
    end    

    var_names={'n','xmn','fm','Error'};
    val =table(n',xmn',fm',E','VariableNames',var_names);
    
end