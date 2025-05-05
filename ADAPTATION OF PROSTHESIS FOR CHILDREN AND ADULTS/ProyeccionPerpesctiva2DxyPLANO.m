% Definición de dimensiones
baby_length = 50; baby_width = 20; baby_height = 15; 
child_length = 100; child_width = 40; child_height = 30; 
teen_male_length = 150; teen_male_width = 60; teen_male_height = 50; 
teen_female_length = 140; teen_female_width = 55; teen_female_height = 48; 
adult_male_length = 180; adult_male_width = 70; adult_male_height = 60; 

% Gráfico en perspectiva 2D (XY plano)
figure;
hold on;
title('Modelos de Prótesis Escaladas (Plano XY)', 'Color', 'k');
xlabel('Longitud (mm)', 'Color', 'k');
ylabel('Anchura (mm)', 'Color', 'k');
grid on;

% Añadir modelos al gráfico XY
plot([0, baby_length], [0, baby_width], 'c', 'LineWidth', 2);
text(baby_length, baby_width, 'Bebé', 'Color', 'k');

plot([0, child_length], [0, child_width], 'b', 'LineWidth', 2);
text(child_length, child_width, 'Niño/Niña', 'Color', 'k');

plot([0, teen_male_length], [0, teen_male_width], 'g', 'LineWidth', 2);
text(teen_male_length, teen_male_width, 'Adolescente Hombre', 'Color', 'k');

plot([0, teen_female_length], [0, teen_female_width], 'm', 'LineWidth', 2);
text(teen_female_length, teen_female_width, 'Adolescente Mujer', 'Color', 'k');

plot([0, adult_male_length], [0, adult_male_width], 'r', 'LineWidth', 2);
text(adult_male_length, adult_male_width, 'Adulto Hombre', 'Color', 'k');

legend('Bebé', 'Niño/Niña', 'Adolescente Hombre', 'Adolescente Mujer', 'Adulto Hombre');
hold off;
