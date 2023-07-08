clear all; close all; clc;

syms h(t) %importante aquí la variable simbólica%
d=0.25;
l=1;
g=9.81;
J=6; %máximo valor del eje de ordenadas%

eqn=diff(h,t) == -((pi().*(d.^2))./(400.*((h.^3)-6.*(h.^2)+25.*h))).*sqrt((2.*g).*(h+1)); %ecuación diferencial%

cond=(h(0)==6); %condición inicial%

ySol(t)=dsolve(eqn,cond); %solución exacta de la ecuación diferencial%

f=@(t,h) -((pi().*(d.^2))./(400.*((h.^3)-6.*(h.^2)+25.*h))).*sqrt((2.*g).*(h+1)); %función handle de f(t,y)%

y0=6; %condición inicial%

t0=0;%abscisa de la condición inicial%

T=26*3600;%abscisa mayor que la inicial de valor que se desee%

dt=2*60*60;%tamaño de la partición equidistante entre t0 y T%

tn=(t0:dt:T);%vector de la partición de t0 hasta T entre 
             %particiones de dt%
             
N=(T-t0)./dt; %número de subintervalos de partición%

yn=zeros(1,N+1);%vector yn de ceros 1xN+1%

yn(1)=y0; %el valor inicial y0 se almacena en la primera componente 
          %del vector yn%
          
for k=1:N
    K1=f(tn(k),yn(k));
    K2=f(tn(k)+dt, yn(k)+dt.*K1);
    yn(k+1)=yn(k)+(0.5).*(dt).*(K1+K2); %fórmula de Heun%
end
toc;
dif=abs(eval(ySol(100))-yn(5));%diferencia en valor absoluto en un punto t%
                                %entre y(t) y la calculada por el método%

plot(tn,yn,'r','linewidth',1.3) %gráfica de y(t) por la fórmula de Heun%
hold on 
fplot(ySol(t),'b','Linewidth',1.3) %gráfica de y(t)%
xlim([0,T])
ylim([0,J])
xlabel('tiempo(s)')
grid on; grid minor;
legend({'aproximación h(t)','h(t)'},'Location','northwest')