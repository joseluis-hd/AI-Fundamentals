%Extraer las columnas de la tabla
x = RegresionLinealSimpleDelitosMex{:, 1};  %Primera columna
y = RegresionLinealSimpleDelitosMex{:, 2};  %Segunda columna

%Regresión lineal
b = x\y;  %Coeficiente sin intercepto (pendiente)

yCalc1 = b*x;  %Predicción de y
scatter(x, y);  %Gráfico de dispersión de los datos
hold on;
plot(x, yCalc1);  %Gráfico de la línea de regresión
xlabel('Población de 18 años y más');
ylabel('Victimas de delitos');
title('Victimas de delitos por habitantes de 18 años y más de Entidad Federativa');
grid on;

%Añadiendo un intercepto (b0)
X = [ones(length(x),1), x];  %Matriz con columna de unos (intercepto)
b = X\y;  %Coeficientes incluyendo pendiente y intercepto
yCalc2 = X*b;  %Predicciones usando pendiente e intercepto
plot(x, yCalc2, '--');  %Graficar la línea de regresión con intercepto
legend('Data', 'Slope', 'Slope & Intercept', 'Location', 'best');
