% Gráfica comparativa de umbrales EMG calculados (60% del valor pico)
clear; clc;

% Etiquetas de las pruebas
etiquetas = {
    'Hombro - Elevación', 'Hombro - Atrás', 'Hombro - Lateral', ...
    'Antebrazo - Mano', 'Antebrazo - Muñeca', ...
    'Dedo - Pulgar', 'Dedo - Índice', 'Dedo - Corazón', ...
    'Dedo - Anular', 'Dedo - Meñique', ...
    'Gesto - Mudra', 'Gesto - Okey', 'Gesto - Paz', ...
    'Gesto - Rock', 'Gesto - Señalar', 'Gesto - Surf'
};

% Matriz de umbrales por canal EMG (A1-A4), en voltios
umbrales = [
    0.54 0.30 0.54 0.30;
    0.58 0.30 0.58 0.30;
    0.60 0.30 0.60 0.30;
    0.56 0.56 0.30 0.30;
    0.30 0.55 0.30 0.55;
    0.53 0.30 0.53 0.30;
    0.30 0.55 0.30 0.55;
    0.54 0.30 0.54 0.30;
    0.30 0.30 0.30 0.52;
    0.30 0.53 0.30 0.53;
    0.30 0.53 0.53 0.30;
    0.30 0.55 0.30 0.55;
    0.30 0.50 0.50 0.30;
    0.56 0.30 0.56 0.30;
    0.30 0.53 0.30 0.53;
    0.51 0.30 0.30 0.51
];

% Vector binario: 1 = Prueba con EMG + ACC + EDA + BTN; 0 = Solo EMG
multicanal = [1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0];

% Preparar la figura
figure;
hold on;

% Colores diferenciados
colorMulti = [0 0.4470 0.7410];      % Azul MATLAB (multicanal)
colorSolo = [0.8500 0.3250 0.0980];  % Naranja MATLAB (solo EMG)

% Dibujar barras agrupadas
for canal = 1:4
    for prueba = 1:length(etiquetas)
        x = prueba + (canal - 2.5) * 0.18;
        hBar = bar(x, umbrales(prueba, canal), 0.15);
        if multicanal(prueba)
            set(hBar, 'FaceColor', colorMulti);
        else
            set(hBar, 'FaceColor', colorSolo);
        end
    end
end

% Configuración general del gráfico
title('Comparativa de Umbrales de Activación EMG por Canal y Configuración de Sensores', ...
      'FontSize', 16, 'FontWeight', 'bold');
xlabel('Prueba realizada', 'FontSize', 20);
ylabel('Umbral de activación (V)', 'FontSize', 20);
xticks(1:length(etiquetas));
xticklabels(etiquetas);
xtickangle(45);
set(gca, 'FontSize', 15);  % Tamaño fuente para los ejes
ylim([0 1]);
grid on;

% Leyenda clara y grande
legend([ ...
    bar(nan, nan, 'FaceColor', colorMulti), ...
    bar(nan, nan, 'FaceColor', colorSolo) ...
], {'Pruebas Multicanal (EMG+ACC+EDA+BTN)', 'Pruebas solo EMG'}, ...
   'Location', 'northeastoutside', 'FontSize', 20);

hold off;

% Confirmación en consola
disp('✅ Gráfico generado correctamente sin etiquetas de texto sobre las barras.');
