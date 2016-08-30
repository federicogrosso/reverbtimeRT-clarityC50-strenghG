%Funcion que precondiciona la respuesta al impulso de un microfono eliminando el ruido mediante un umbral
%Entradas:
%  S: señal correspondiente a la respuesta al impulso de un microfono
%  fm: frecuencia de muestreo
%Salida:
%  Spre: señal precondicionada sin ruido

function [Spre] = Precond(S,fm)
    n = length(S);
    %Calculo la cantidad de muestras correspondientes al 10% de la señal
    porc = n*0.1;
    %Calculo el tamaño de la ventana que debe esta por debajo del umbral 
    %tamaño ventana = fm * 10 ms / 1000 ms -> tamaño en muestras
    tamvent = fm*10/1000;
    [smax,idx] = max(abs(S));
    %Corto el tramo inicial de la señal hasta el maximo
    Saux = S(idx:end);
    %Tramo final de la señal para calcular el umbral
    ruido = Saux(end-porc:end);
    %Calculo del umbral
    umbral = (sum(ruido.^2)/porc)*10;
    
    cont = 0;
    SEnerg = Saux.^2;
    i = idx;
    while (cont < tamvent) 
        if (SEnerg(i) < umbral)
            cont = cont+1;
        else
            cont = 0;
        end
        i = i+1;
    end
    Spre = Saux(1:i-1);
end