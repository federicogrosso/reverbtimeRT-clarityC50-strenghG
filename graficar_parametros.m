%Funcion que realiza las graficas de los parametros acusticos

function [] = graficar_parametros(FC,RTprom,C80prom,Gprom,RTcolor,C80color,Gcolor)
    %Tabla de datos
    fprintf('PARAMETROS ACUSTICOS\n');
    fprintf('Promedios por banda de octavas\n\n');
    fprintf(' Octavas  TiempoReverb  Claridad  Sonoridad\n');
    for i=1:6
        fprintf('%6d %12.4f %11.4f %10.4f\n',FC(i),RTprom(i),C80prom(i),Gprom(i));
    end
    
    %Graficas
    figure('Name','Tiempo de reverberacion');
    subplot(1,2,1);
    bar(RTprom);
    title('RTime promedio por bandas');
    xlabel('Banda de octavas (Hz)');
    ylabel('Tiempo (seg)');
    subplot(1,2,2);
    contourf(RTcolor{3});
    title('RTime de microfonos en 500 Hz');
    
    figure('Name','Claridad');
    subplot(1,2,1);
    bar(C80prom);
    title('Claridad promedia por bandas');
    xlabel('Banda de octavas (Hz)');
    ylabel('dB');
    subplot(1,2,2);
    contourf(C80color{3});
    title('Claridad de microfonos en 500 Hz');
    
    figure('Name','Sonoridad');
    subplot(1,2,1);
    bar(Gprom);
    title('Sonoridad promedia por bandas');
    xlabel('Banda de octavas (Hz)');
    ylabel('dB');
    subplot(1,2,2);
    contourf(Gcolor{3});
    title('Sonoridad de microfonos en 500 Hz');
end