% Definición de dimensiones
baby_length = 50; baby_width = 20; 
child_length = 100; child_width = 40; 
teen_male_length = 150; teen_male_width = 60; 
teen_female_length = 140; teen_female_width = 55; 
adult_male_length = 180; adult_male_width = 70; 

% Gráfico en perspectiva 2D (XY plano)
figure;
hold on;
title('Modelos de Prótesis Escaladas (Plano XY)', 'Color', 'k');
xlabel('Longitud (mm)', 'Color', 'k');
ylabel('Anchura (mm)', 'Color', 'k');
grid on;

% Añadir modelos al gráfico XY con escalas
plot([0, baby_length], [0, baby_width], 'c', 'LineWidth', 2);
text(baby_length, baby_width, ...
    sprintf('Bebé\nL: %d\nA: %d', baby_length, baby_width), 'Color', 'k');

plot([0, child_length], [0, child_width], 'b', 'LineWidth', 2);
text(child_length, child_width, ...
    sprintf('Niño/Niña\nL: %d\nA: %d', child_length, child_width), 'Color', 'k');

plot([0, teen_male_length], [0, teen_male_width], 'g', 'LineWidth', 2);
text(teen_male_length, teen_male_width, ...
    sprintf('Adolescente Hombre\nL: %d\nA: %d', teen_male_length, teen_male_width), 'Color', 'k');

plot([0, teen_female_length], [0, teen_female_width], 'm', 'LineWidth', 2);
text(teen_female_length, teen_female_width, ...
    sprintf('Adolescente Mujer\nL: %d\nA: %d', teen_female_length, teen_female_width), 'Color', 'k');

plot([0, adult_male_length], [0, adult_male_width], 'r', 'LineWidth', 2);
text(adult_male_length, adult_male_width, ...
    sprintf('Adulto Hombre\nL: %d\nA: %d', adult_male_length, adult_male_width), 'Color', 'k');

legend('Bebé', 'Niño/Niña', 'Adolescente Hombre', 'Adolescente Mujer', 'Adulto Hombre');
hold off;
