function [] = graficar_mic(smic,Spre,Sfilt,edt,fm)
    dt = 1/fm;
    t = 0:dt:2-dt;
    
    figure('Name','Pasos para obtener la curva de decaimiento');
    
    subplot(3,1,1);
    plot(t,smic);
    title('Respuesta al impulso del microfono 1');
    
    subplot(3,1,2);
    plot(t(1:length(Spre)),Spre);
    title('Respuesta al impulso sin ruido');
    
    subplot(3,1,3);
    plot(t(1:length(Spre)),Sfilt(3,:));
    title('Respuesta al impulso filtrada en 500 Hz');
    
    figure('Name','Curvas de decaimiento');
    colores = ['b' 'r' 'm' 'c' 'g' 'k'];
    hold on;
    for i=1:6
        plot(edt(i,:),colores(i));
    end
    hold off;
    title('Curvas de decaimiento');
    legend('125 Hz','250 Hz','500 Hz','1000 Hz','2000 Hz','4000 Hz');
    ylabel('dB');
end