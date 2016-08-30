%Funcion para calcular la curva de decaimiento de la energia
%Entrada:
%  Sfilt: matriz correspondiente a la señal filtrada de un microfono por banda de octavas
%Salida:
%  edt: matriz de la curva de decaimiento correspondiente a un microfono por banda de octavas

function [edt] = EDT(Sfilt)
    [nf,nc] = size(Sfilt);
    edt = zeros(nf,nc);
    for i=1:nf
        SEnerg = (Sfilt(i,:).^2);
        %Metodo de integracion hacia atras
        SEnerg = fliplr(SEnerg);
        SEnerg = cumsum(SEnerg);
        SEnerg = fliplr(SEnerg);
        maximo = max(SEnerg);
        edt(i,:) = 10*log10(SEnerg/maximo);
    end
end