clear all; close all; clc;
syms h(t)
d=0.25;
g=9.81;
J=4.5; %máximo valor del eje de ordenadas%
f=@(t,h) -(((0.25.^2).*sqrt(2.*9.81))./16).*(sqrt(h)./(((h./5)+2).^2)) ; 
                            %función handle de f(h,t)%
hsol=@(t,h) (2/125)*(h.^(5/2))+(8/15)*(h.^(3/2))+8*sqrt(h)-(7792/375)+((sqrt(2.*g).*t)./256);
h0=4; %condición inicial%

t0=0;%abscisa de la condición inicial%

T=16*60;%abscisa mayor que la inicial de valor que se desee%

dt=2;%tamaño de la partición equidistante entre t0 y T%

tn=(t0:dt:T);%vector de la partición de t0 hasta T entre 
             %particiones de dt%
             
N=(T-t0)./dt; %número de subintervalos de partición%

yn=zeros(1,N+1);%vector yn de ceros 1xN+1%

yn(1)=h0; %el valor inicial y0 se almacena en la primera componente 
          %del vector yn%
          
for k=1:N
    yn(k+1)=yn(k)+dt.*f(tn(k),yn(k)); %fórmula de Euler%
end

                           
plot(tn,yn,'r','linewidth',1.3) %gráfica de y(t) por la fórmula de Euler%
hold on 
fimplicit(hsol,'b','Linewidth',1.3) %gráfica de y(t)%
xlim([0,T])
ylim([0,J])
xlabel('tiempo(s)')
grid on; grid minor;
legend({'aproximación h(t)','h(t)'},'Location','northwest')
