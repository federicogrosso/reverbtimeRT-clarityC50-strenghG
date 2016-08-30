%Funcion para calcular el promedio de cada parametro acustico
%Entradas:
%  rtime: celda con los tiempos de reverberacion de todos los microfonos en todas las banda de octavas
%  C80: celda con la claridad de todos los microfonos en todas las banda de octavas
%  G: celda con la sonoridad de todos los microfonos en todas las banda de octavas
%Salidas:
%  RTprom: vector con los tiempos de reverberacion promedios correspondientes a cada banda de octavas
%  C80prom: vector con la claridad promedia correspondiente a cada banda de octavas
%  Gprom: vector con la sonoridad promedia correspondiente a cada banda de octavas
%  RTcolor, C80color, Gcolor: celdas con la matriz de microfonos correspondientes a cada banda (para grafico de colores)

function [RTprom,C80prom,Gprom,RTcolor,C80color,Gcolor] = promedios(rtime,C80,G)
    [nf,nc] = size(rtime);
    
    RTprom = zeros(1,6);
    C80prom = zeros(1,6);
    Gprom = zeros(1,6);
    
    RTcolor{6} = [];
    C80color{6} = [];
    Gcolor{6} = [];
    
    %Recorro por cada banda de octavas
    for b=1:6
        RTsum = 0;
        C80sum = 0;
        Gsum = 0;
        
        MRT = zeros(nf,nc);
        MC80 = zeros(nf,nc);
        MG = zeros(nf,nc);
        
        %Recorro la matriz de microfonos
        for i=1:nf
            for j=1:nc
                RTsum = RTsum + rtime{i,j}(b);
                C80sum = C80sum + C80{i,j}(b);
                Gsum = Gsum + G{i,j}(b);
                
                MRT(i,j) = rtime{i,j}(b);
                MC80(i,j) = C80{i,j}(b);
                MG(i,j) = G{i,j}(b);
            end
        end
        
        RTprom(b) = RTsum/(nf*nc);
        C80prom(b) = C80sum/(nf*nc);
        Gprom(b) = Gsum/(nf*nc);
        
        RTcolor{b} = MRT;
        C80color{b} = MC80;
        Gcolor{b} = MG;
    end
end