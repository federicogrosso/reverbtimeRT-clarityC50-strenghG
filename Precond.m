%Funcion que precondiciona la respuesta al impulso de un microfono eliminando el ruido mediante un umbral
%Entradas:
%  S: se�al correspondiente a la respuesta al impulso de un microfono
%  fm: frecuencia de muestreo
%Salida:
%  Spre: se�al precondicionada sin ruido

function [Spre] = Precond(S,fm)
    n = length(S);
    %Calculo la cantidad de muestras correspondientes al 10% de la se�al
    porc = n*0.1;
    %Calculo el tama�o de la ventana que debe esta por debajo del umbral 
    %tama�o ventana = fm * 10 ms / 1000 ms -> tama�o en muestras
    tamvent = fm*10/1000;
    [smax,idx] = max(abs(S));
    %Corto el tramo inicial de la se�al hasta el maximo
    Saux = S(idx:end);
    %Tramo final de la se�al para calcular el umbral
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