%Funcion para calcular la sonoridad
%Entradas:
%  Sfilt: matriz correspondiente a la señal filtrada de un microfono por banda de octavas
%  rt60: vector con el tiempo de reverberacion en cada banda de octavas
%  V: volumen de la habitacion
%Salida:
%  G: vector con la sonoridad en cada banda de octavas

%Ecuacion para la sonoridad G
% G = (Lpe - Lpe10) dB
%donde:
%  Lpe = 10 * log( (1/T0)*(p(t)^2/p0^2) ) dB
%  Lpe10 = Lpe + 10 * log(A/S0) - 37 dB
%con:
%  T0 = 1 s (un segundo)
%  p0 = 20*10^-6 Pa (20 micro pascales)
%  S0 = 1 m^2 (un metro cuadrado)
%  A = 0.16 * V/T

%Definiciones:
% p(t) -> presion acustica instantanea de la respuesta al impulso
% p10(t) -> presion acustica instanea de la respuesta al impulso a una distancia de 10 m en un campo libre
% Lpe ->  nivel de presion sonora de p(t)
% Lpe10 -> nivel de presion sonora de p10(t)
% A -> area de absorcion acustica en metros cuadrados
% V -> volumen de aire de la habitacion en metros cubicos
% T -> tiempo de reverberacion en segundos


function [G] = sonoridad(Sfilt,rt60,V)
    n = length(rt60);
    G = zeros(1,n);
    
    %Definimos las constantes
    T0 = 1;
    p0 = 20*(10^-6);
    S0 = 1;
    
    for i=1:n
        T = rt60(i);
        Lpe = 10 * log10(1/T0*sum((Sfilt(i,:).^2)./p0^2));
        A = 0.16*V/T;
        Lpe10 = Lpe + 10*log10(A/S0) - 37;
        G(i) = Lpe - Lpe10;
    end
end