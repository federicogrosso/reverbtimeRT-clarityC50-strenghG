%Funcion para calcular la claridad C80
%Entradas:
%  Sfilt: matriz correspondiente a la señal filtrada de un microfono por banda de octavas
%  fm: frecuencia de muestreo
%Salida:
%  C80: vector con la claridad en dB correspondiente a cada banda de octavas

function [C80] = clarity(Sfilt,fm)
    %Calculo la muestra correspondiente a los 80 ms
    lim = 80*fm/1000;
    [nf,nc] = size(Sfilt);
    C80 = zeros(1,nf);
    for i=1:nf
        C80(i) = 10*log10(sum(Sfilt(i,1:lim).^2)/sum(Sfilt(i,lim:end).^2));
    end
end