%Funcion para cargar la base de datos de los microfonos
%Entradas:
%  nom: nombre del archivo .txt donde se encuentran los nombres de las respuestas al impulso de cada microfono
%  n: cantidad de microfonos
%  fm: frecuencia de muestreo
%  t: duracion de la respuesta al impulso
%Salida:
%  s: matriz con las respuesta al impulso correspondiente a una fila por cada microfono

function [s] = CargoDatos(nom,n,fm,t)
    %Genero una celda para guardar cada nombre con el importdata
    datos = importdata(nom);
    s = zeros(n,fm*t);
    Fm = zeros(n,1);
    for i=1:length(datos)
        %Cargo en la matriz s todas las respuesta al impulso, cada fila es una señal diferente (microfono)
        [s(i,:),Fm(i)] = audioread(datos{i});
    end
end