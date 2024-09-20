%Extraer las columnas de la tabla
x = RegresionLinealSimple{:, 1};  %Primera columna
y = RegresionLinealSimple{:, 2};  %Segunda columna

%Regresión lineal
b = x\y;  %Coeficiente sin intercepto (pendiente)

yCalc1 = b*x;  %Predicción de y
scatter(x, y);  %Gráfico de dispersión de los datos
hold on;
plot(x, yCalc1);  %Gráfico de la línea de regresión
xlabel('Población de automovilistas por estado');
ylabel('Accidentes por estado');
title('Regresión Lineal - Predicción Accidentes');
grid on;

%Añadiendo un intercepto (b0)
X = [ones(length(x),1), x];  %Matriz con columna de unos (intercepto)
b = X\y;  %Coeficientes incluyendo pendiente y intercepto
yCalc2 = X*b;  %Predicciones usando pendiente e intercepto
plot(x, yCalc2, '--');  %Graficar la línea de regresión con intercepto
legend('Data', 'Slope', 'Slope & Intercept', 'Location', 'best');
