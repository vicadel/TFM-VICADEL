data = readmatrix('datos_EMG.csv'); 
time = data(:,1); 
emg_signals = data(:,2:end);

% Graficar todas las señales
figure;
plot(time, emg_signals);
xlabel('Tiempo (s)');
ylabel('Amplitud EMG');
title('Señales EMG capturadas en diferentes pruebas');
legend('Hombro', 'Muñón', 'Flexores', 'Extensores');
grid on;
