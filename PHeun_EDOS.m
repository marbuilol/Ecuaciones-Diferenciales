clear all; close all; clc;
syms h(t)
d=0.25;
g=9.81;
J=5.5; %máximo valor del eje de ordenadas%
f=@(t,h) (1./(4*pi().*(((h./5)+2).^2))).*(((t./1000)-((pi().*(d.^2))./4).*sqrt(2.*g.*(h+0.3)))); 
                            %función handle de f(h,t)%
h0=4; %condición inicial%

t0=0;%abscisa de la condición inicial%

T=18*60;%abscisa mayor que la inicial de valor que se desee%

dt=2;%tamaño de la partición equidistante entre t0 y T%

tn=(t0:dt:T);%vector de la partición de t0 hasta T entre 
             %particiones de dt%
             
N=(T-t0)./dt; %número de subintervalos de partición%

yn=zeros(1,N+1);%vector yn de ceros 1xN+1%

yn(1)=h0; %el valor inicial y0 se almacena en la primera componente 
          %del vector yn%
          
for k=1:N
    K1=f(tn(k),yn(k));
    K2=f(tn(k)+dt, yn(k)+dt.*K1);
    yn(k+1)=yn(k)+(0.5).*(dt).*(K1+K2); %fórmula de Heun%
end

                           
plot(tn,yn,'r','linewidth',1.3) %gráfica de y(t) por la fórmula de Heun%
xlim([0,T])
ylim([3,J])
xlabel('tiempo(s)')
grid on; grid minor;
legend({'aproximación h(t)','h(t)'},'Location','northwest')
