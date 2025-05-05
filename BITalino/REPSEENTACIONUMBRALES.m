% Gráfica comparativa de umbrales EMG calculados (60% del valor pico)
clear; clc;

% Etiquetas de las pruebas (puedes ampliarlas si añades más)
etiquetas = {
    'Hombro - Elevación', 'Hombro - Atrás', 'Hombro - Lateral', ...
    'Antebrazo - Mano', 'Antebrazo - Muñeca', ...
    'Dedo - Pulgar', 'Dedo - Índice', 'Dedo - Corazón', ...
    'Dedo - Anular', 'Dedo - Meñique', ...
    'Gesto - Mudra', 'Gesto - Okey', 'Gesto - Paz', ...
    'Gesto - Rock', 'Gesto - Señalar', 'Gesto - Surf'
};

% Matriz de umbrales por canal EMG (A1-A4), en voltios
% Cada fila = una prueba | Columnas = A1 A2 A3 A4
umbrales = [
    0.54 0.30 0.54 0.30;   % Hombro Elevación
    0.58 0.30 0.58 0.30;   % Hombro Atrás
    0.60 0.30 0.60 0.30;   % Hombro Lateral
    0.56 0.56 0.30 0.30;   % Antebrazo Mano
    0.30 0.55 0.30 0.55;   % Antebrazo Muñeca
    0.53 0.30 0.53 0.30;   % Pulgar
    0.30 0.55 0.30 0.55;   % Índice
    0.54 0.30 0.54 0.30;   % Corazón
    0.30 0.30 0.30 0.52;   % Anular
    0.30 0.53 0.30 0.53;   % Meñique
    0.30 0.53 0.89 0.30;   % Mudra
    0.30 0.55 0.30 0.55;   % Okey
    0.30 0.50 0.50 0.30;   % Paz
    0.56 0.30 0.56 0.30;   % Rock
    0.30 0.53 0.30 0.53;   % Señalar
    0.51 0.30 0.30 0.51    % Surf
];

% Gráfico
figure;
bar(umbrales, 'grouped');
title('Comparativa de Umbrales EMG por Canal (60% del pico)');
xlabel('Prueba realizada');
ylabel('Umbral (V)');
legend('Canal A1', 'Canal A2', 'Canal A3', 'Canal A4');
xticks(1:length(etiquetas));
xticklabels(etiquetas);
xtickangle(45);
grid on;
ylim([0 1]);

% Comentario adicional
disp('Gráfico generado correctamente. Se comparan los umbrales calculados en cada prueba según el canal EMG.');
