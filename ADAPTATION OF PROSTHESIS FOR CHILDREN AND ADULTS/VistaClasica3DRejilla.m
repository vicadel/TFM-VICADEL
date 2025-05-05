% Definición de dimensiones
baby_length = 50; baby_width = 20; baby_height = 15; 
child_length = 100; child_width = 40; child_height = 30; 
teen_male_length = 150; teen_male_width = 60; teen_male_height = 50; 
teen_female_length = 140; teen_female_width = 55; teen_female_height = 48; 
adult_male_length = 180; adult_male_width = 70; adult_male_height = 60; 

% Gráfico clásico en 3D
figure;
hold on;
title('Modelos de Prótesis Escaladas (Clásico 3D)', 'Color', 'k');
xlabel('Longitud (mm)', 'Color', 'k');
ylabel('Anchura (mm)', 'Color', 'k');
zlabel('Altura (mm)', 'Color', 'k');
grid on;

% Añadir modelos al gráfico 3D
plot3([0, baby_length], [0, baby_width], [0, baby_height], 'c', 'LineWidth', 2);
text(baby_length, baby_width, baby_height, 'Bebé', 'Color', 'k');

plot3([0, child_length], [0, child_width], [0, child_height], 'b', 'LineWidth', 2);
text(child_length, child_width, child_height, 'Niño/Niña', 'Color', 'k');

plot3([0, teen_male_length], [0, teen_male_width], [0, teen_male_height], 'g', 'LineWidth', 2);
text(teen_male_length, teen_male_width, teen_male_height, 'Adolescente Hombre', 'Color', 'k');

plot3([0, teen_female_length], [0, teen_female_width], [0, teen_female_height], 'm', 'LineWidth', 2);
text(teen_female_length, teen_female_width, teen_female_height, 'Adolescente Mujer', 'Color', 'k');

plot3([0, adult_male_length], [0, adult_male_width], [0, adult_male_height], 'r', 'LineWidth', 2);
text(adult_male_length, adult_male_width, adult_male_height, 'Adulto Hombre', 'Color', 'k');

legend('Bebé', 'Niño/Niña', 'Adolescente Hombre', 'Adolescente Mujer', 'Adulto Hombre');
view(3); % Vista en 3D
hold off;
