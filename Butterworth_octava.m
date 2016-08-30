%Genera el banco de filtros para las octavas de 125 Hz, 250 Hz, 500 Hz, 1000 Hz, 2000 Hz y 4000 Hz
%Entradas:
%  fc: frecuencias para filtrar (octavas)
%  fm: frecuencia de muestreo
%  N: orden del filtro Butterworth
%Salidas:
%  b,a: coeficientes del filtro Butterworth

function [b,a] = Butterworth_octava(fc,fm,N)
    n = length(fc);
    for i=1:n
        %La funcion octdsgn diseña un filtro digital con octava centrada en frecuencia fc de frecuencia de muestreo fs
        [B,A] = octdsgn(fc(i),fm,N);
        %b y a son matrices donde cada fila corresponde a los coeficientes de una octava
        b(i,:) = B';
        a(i,:) = A';
    end
end