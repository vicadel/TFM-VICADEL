fs = 1000;
[b, a] = butter(4, [20 500] / (fs/2), 'bandpass');
filtered_emg = filtfilt(b, a, emg_signals);

% Graficar señal filtrada
figure;
plot(time, filtered_emg);
xlabel('Tiempo (s)');
ylabel('Amplitud EMG filtrada');
title('Señales EMG después del filtrado');
legend('Hombro', 'Muñón', 'Flexores', 'Extensores');
grid on;
