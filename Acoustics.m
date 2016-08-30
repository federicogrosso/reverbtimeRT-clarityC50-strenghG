%Script principal

%Frecuencia de muestreo
FM = 96000;

%cd Omni_Aula
cd Omni_Hall
%cd Omni_Octogono

%Cargo los datos - load data
[s] = CargoDatos('Hall.txt',169,FM,2); %% ***.txt contains data of different places.
[NF,NC] = size(s);

cd ..

%Vector de Octavas - octave vector hz
FC = [125 250 500 1000 2000 4000];

%Matriz de microfonos - mic matrix
mf = 13;
mc = 13;

%Calculo el banco de filtros(filter bank) -> b y a matriz de coeficientes donde cada fila pertenece a cada banda empezando por la de 125Hz
[b,a] = Butterworth_octava(FC,FM,3);

%Volumen de la habitacion (m3)
V = 4500; %(aula)
%V = 7.5 * 9 * 3.5; %(aula)
% 4400m3 (hall)
% 9500m3 (octogono)

%El tamaño esta al reves porque despues la trasponemos e invertimos para que queden organizados como en la habitacion
rtime{mc,mf} = [];
C80{mc,mf} = [];
G{mc,mf} = [];

%Empezamos a calcular los parametros para cada microfono y lo vamos guardando en las celdas anteriores
mic = 1;
for i=1:mc
    for j=1:mf
        %Precondicion para acortar la señal (eliminar ruido)
        Spre = Precond(s(mic,:),FM);
        
        %Filtro cada microfono en las 6 bandas
        Sfilt = Filtrado(a,b,Spre);
        
        %Calculo la curva de decaimiento
        edt = EDT(Sfilt);
        
        if (mic == 1)
            %Graficas de un microfono
            graficar_mic(s(mic,:),Spre,Sfilt,edt,FM);
        end
        
        %Calculo el tiempo de reberveracion
        rt60 = RT60(edt,FM);
        rtime{i,j} = [rt60 mic];
        
        %Calculo la claridad
        c80 = clarity(Sfilt,FM);
        C80{i,j} = [c80 mic];
        
        %Calculo la sonoridad
        g = sonoridad(Sfilt,rt60,V);
        G{i,j} = [g mic];
        
        mic = mic+1;
    end
end

%Trasponemos e invertimos para que queden organizados como en la habitacion
rtime = flipud(rtime');
C80 = flipud(C80');
G = flipud(G');

%Calculamos los promedios de cada parametro acustico
[RTprom,C80prom,Gprom,RTcolor,C80color,Gcolor] = promedios(rtime,C80,G);

%Graficas de parametros acusticos
graficar_parametros(FC,RTprom,C80prom,Gprom,RTcolor,C80color,Gcolor);

