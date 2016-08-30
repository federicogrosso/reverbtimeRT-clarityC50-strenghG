%Funcion para calcular el tiempo de reverberacion
%Entradas:
%  edt: matriz de curva de decaimiento correspondiente a un microfono en cada banda de octavas
%  fm: frecuencia de muestreo
%Salida:
%  rt60: vector con el tiempo de reverberacion en cada banda de octavas

function [rt60] = RT60(edt,fm)
    [nf,nc] = size(edt);
    rt60 = zeros(1,nf);
    for i=1:nf
        vec = edt(i,:);
        j = 1;
        idx1 = 0;
        idx2 = 0;
        
        while (idx1==0 & j<=nc)
            if (floor(vec(j))==(-5))
                idx1 = j;
            end
            j = j+1;
        end
        
        while (idx2==0 & j<=nc)
            if (floor(vec(j))==(-25))
                idx2 = j;
            end
            j = j+1;
        end
        
        rt60(i) = ((idx2-idx1)/fm)*3;
        
    end
end