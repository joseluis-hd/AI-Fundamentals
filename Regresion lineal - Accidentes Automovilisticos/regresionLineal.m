%Regresion lineal prediccion de accidentes viales.
load accidents
x = hwydata(:,14); %Poblacion de automovilistas por estado
y = hwydata(:,4); %Accidentes por estado
format long

b1 = x\y %Pendiente

yCalc1 = b1*x;
scatter(x,y)
hold on
plot(x,yCalc1)
xlabel('Poblacion de automovilistas por estado')
ylabel('Accidentes por estado')
title('Regresion Lineal - Prediccion Accidentes')
grid on

X = [ones(length(x),1),x];
%Y=XB
b = X\y %Coeficientes pendiente y origen
yCalc2 = X*b;
plot(x,yCalc2,'--')
legend('Data','Slope','Slope & Intercept','Location','best');

R1 = 1 - sum((y-yCalc1).^2)/sum((y-mean(y)).^2)
R2 = 1 - sum((y-yCalc2).^2)/sum((y-mean(y)).^2)