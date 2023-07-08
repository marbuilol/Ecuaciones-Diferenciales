clc; close all;
format long
% REPRESENTACIÓN GRÁFICA DE LA CURVA CARACTERÍSTICA

t=0:0.01:40; %defino un vector tiempo que desea
for x0=-5:0.25:5
    
    xc=1.6666.*(0.3-(0.5.*(tanh(x0/3))))*t+x0;%ecuación de x(t) en función del tiempo 
                                    %y con parámetro inicial x0
                   
    hold on %hold on para que todas las curvas estén en una misma gráfica
    
    plot(xc,t,'b','linewidth',1.3)%representación gráfica
    
    xlabel('tiempo(s)')%nombre del eje X
    ylabel('x(t)')%nombre del eje Y
    grid on; grid minor;
end
title('Curva característica x(t) para distintos valores de x0')