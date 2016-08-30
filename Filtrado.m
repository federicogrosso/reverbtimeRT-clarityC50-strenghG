%Funcion que realiza el filtrado de un microfono en las banda de octavas
%Entradas:
%  a,b: matrices con los coeficientes del banco de filtros
%  S: señal a filtrar correspondiente a un microfono
%Salida:
%  Sfilt: matriz correspondiente a la señal filtrada por banda de octavas

function [SFilt] = Filtrado(a,b,S)
    for i=1:6
        SFilt(i,:) = filter(b(i,:),a(i,:),S);
    end
end