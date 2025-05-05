% Definición de dimensiones
baby_width = 20; baby_height = 15; 
child_width = 40; child_height = 30; 
teen_male_width = 60; teen_male_height = 50; 
teen_female_width = 55; teen_female_height = 48; 
adult_male_width = 70; adult_male_height = 60; 

% Gráfico frontal
figure;
hold on;
title('Modelos de Prótesis Escaladas (Vista Frontal)', 'Color', 'k');
ylabel('Anchura (mm)', 'Color', 'k');
zlabel('Altura (mm)', 'Color', 'k');
grid on;

% Añadir modelos al gráfico frontal con escalas
plot([0, baby_width], [0, baby_height], 'c', 'LineWidth', 2);
text(baby_width, baby_height, ...
    sprintf('Bebé\nA: %d\nH: %d', baby_width, baby_height), 'Color', 'k');

plot([0, child_width], [0, child_height], 'b', 'LineWidth', 2);
text(child_width, child_height, ...
    sprintf('Niño/Niña\nA: %d\nH: %d', child_width, child_height), 'Color', 'k');

plot([0, teen_male_width], [0, teen_male_height], 'g', 'LineWidth', 2);
text(teen_male_width, teen_male_height, ...
    sprintf('Adolescente Hombre\nA: %d\nH: %d', teen_male_width, teen_male_height), 'Color', 'k');

plot([0, teen_female_width], [0, teen_female_height], 'm', 'LineWidth', 2);
text(teen_female_width, teen_female_height, ...
    sprintf('Adolescente Mujer\nA: %d\nH: %d', teen_female_width, teen_female_height), 'Color', 'k');

plot([0, adult_male_width], [0, adult_male_height], 'r', 'LineWidth', 2);
text(adult_male_width, adult_male_height, ...
    sprintf('Adulto Hombre\nA: %d\nH: %d', adult_male_width, adult_male_height), 'Color', 'k');

legend('Bebé', 'Niño/Niña', 'Adolescente Hombre', 'Adolescente Mujer', 'Adulto Hombre');
hold off;
