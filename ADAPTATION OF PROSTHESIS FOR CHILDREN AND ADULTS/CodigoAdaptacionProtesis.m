% Generación de prótesis escalable según edad, sexo y complexión
% Parámetros base (hombre de complexión media adulta)
base_length = 200; % Longitud base (mm)
base_width = 50;   % Anchura base (mm)
base_height = 30;  % Altura base (mm)

% Escalas según edad, sexo y complexión
% Etapas de la vida
scale_baby = 0.3;         % Bebé (0-2 años, 30% del tamaño base)
scale_child = 0.5;        % Niño/niña (3-12 años, 50% del tamaño base)
scale_teen_male = 0.9;    % Adolescente hombre (13-18 años, 90% del tamaño base)
scale_teen_female = 0.75; % Adolescente mujer (13-18 años, 75% del tamaño base)
scale_adult_male = 1.0;   % Adulto hombre (19-65 años, 100% del tamaño base)
scale_adult_female = 0.8; % Adulto mujer (19-65 años, 80% del tamaño base)
scale_elder_male = 0.95;  % Hombre mayor (65+ años, 95% del tamaño base)
scale_elder_female = 0.75;% Mujer mayor (65+ años, 75% del tamaño base)

% Complexiones específicas
scale_large = 1.25;   % Persona más grande (125% del tamaño base)
scale_obese = 1.5;    % Persona con sobrepeso (150% del tamaño base)

% Dimensiones escaladas
% Bebé
baby_length = base_length * scale_baby;
baby_width = base_width * scale_baby;
baby_height = base_height * scale_baby;

% Niño/niña
child_length = base_length * scale_child;
child_width = base_width * scale_child;
child_height = base_height * scale_child;

% Adolescente hombre
teen_male_length = base_length * scale_teen_male;
teen_male_width = base_width * scale_teen_male;
teen_male_height = base_height * scale_teen_male;

% Adolescente mujer
teen_female_length = base_length * scale_teen_female;
teen_female_width = base_width * scale_teen_female;
teen_female_height = base_height * scale_teen_female;

% Adulto hombre
adult_male_length = base_length * scale_adult_male;
adult_male_width = base_width * scale_adult_male;
adult_male_height = base_height * scale_adult_male;

% Adulto mujer
adult_female_length = base_length * scale_adult_female;
adult_female_width = base_width * scale_adult_female;
adult_female_height = base_height * scale_adult_female;

% Hombre mayor
elder_male_length = base_length * scale_elder_male;
elder_male_width = base_width * scale_elder_male;
elder_male_height = base_height * scale_elder_male;

% Mujer mayor
elder_female_length = base_length * scale_elder_female;
elder_female_width = base_width * scale_elder_female;
elder_female_height = base_height * scale_elder_female;

% Personas grandes o con sobrepeso
large_length = base_length * scale_large;
large_width = base_width * scale_large;
large_height = base_height * scale_large;

obese_length = base_length * scale_obese;
obese_width = base_width * scale_obese;
obese_height = base_height * scale_obese;

% Mostrar resultados
fprintf('Dimensiones para bebé: %.2f x %.2f x %.2f mm\n', baby_length, baby_width, baby_height);
fprintf('Dimensiones para niño/niña: %.2f x %.2f x %.2f mm\n', child_length, child_width, child_height);
fprintf('Dimensiones para adolescente hombre: %.2f x %.2f x %.2f mm\n', teen_male_length, teen_male_width, teen_male_height);
fprintf('Dimensiones para adolescente mujer: %.2f x %.2f x %.2f mm\n', teen_female_length, teen_female_width, teen_female_height);
fprintf('Dimensiones para adulto hombre: %.2f x %.2f x %.2f mm\n', adult_male_length, adult_male_width, adult_male_height);
fprintf('Dimensiones para adulto mujer: %.2f x %.2f x %.2f mm\n', adult_female_length, adult_female_width, adult_female_height);
fprintf('Dimensiones para hombre mayor: %.2f x %.2f x %.2f mm\n', elder_male_length, elder_male_width, elder_male_height);
fprintf('Dimensiones para mujer mayor: %.2f x %.2f x %.2f mm\n', elder_female_length, elder_female_width, elder_female_height);
fprintf('Dimensiones para personas grandes: %.2f x %.2f x %.2f mm\n', large_length, large_width, large_height);
fprintf('Dimensiones para personas con sobrepeso: %.2f x %.2f x %.2f mm\n', obese_length, obese_width, obese_height);

% Visualización de los modelos en escalas
figure;
hold on;
title('Modelos de Prótesis Escaladas según Edad, Sexo y Complexión', 'Color', 'k');
xlabel('Longitud (mm)', 'Color', 'k');
ylabel('Anchura (mm)', 'Color', 'k');
zlabel('Altura (mm)', 'Color', 'k');

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

plot3([0, adult_female_length], [0, adult_female_width], [0, adult_female_height], 'k', 'LineWidth', 2);
text(adult_female_length, adult_female_width, adult_female_height, 'Adulto Mujer', 'Color', 'k');

plot3([0, elder_male_length], [0, elder_male_width], [0, elder_male_height], 'y', 'LineWidth', 2);
text(elder_male_length, elder_male_width, elder_male_height, 'Hombre Mayor', 'Color', 'k');

plot3([0, elder_female_length], [0, elder_female_width], [0, elder_female_height], 'c', 'LineWidth', 2);
text(elder_female_length, elder_female_width, elder_female_height, 'Mujer Mayor', 'Color', 'k');

plot3([0, large_length], [0, large_width], [0, large_height], [0.5, 0.25, 0], 'LineWidth', 2);
text(large_length, large_width, large_height, 'Grande', 'Color', 'k');

plot3([0, obese_length], [0, obese_width], [0, obese_height], [0.5, 0.25, 0.25], 'LineWidth', 2);
text(obese_length, obese_width, obese_height, 'Sobrepeso', 'Color', 'k');

legend('Bebé', 'Niño/Niña', 'Adolescente Hombre', 'Adolescente Mujer', 'Adulto Hombre', ...
       'Adulto Mujer', 'Hombre Mayor', 'Mujer Mayor', 'Grande', 'Sobrepeso');
grid on;
hold off;