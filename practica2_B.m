clc; close all;
format long

%REPRESENTACIÓN DE LA SOLUCIÓN

u0=@(x) 0.35+((0.25).*tanh(x/3)); %condición inicial

x0=-5:0.01:5; %vector x0

t=0:0.1:5; %vector tiempo con la distribución que queramos

n=length(t);%longitud del vector t

for i=1:1:n
    hold on
    plot(1.6667.*(0.3-(0.5.*(tanh(x0/3))))*t(i)+x0,u0(x0),'r','linewidth',1.3) %representación gráfica
    xlabel('x(t)')  %nombre de las abscisas
    ylabel('u0(x0)') %nombre de las ordenadas
    
    grid on; grid minor;
    title('Curvas u(x,t)')
end