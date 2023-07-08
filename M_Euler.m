clear all; close all; clc;

syms h(t) %importante aquí la variable simbólica%
d=0.25;
g=9.81;
J=6; %máximo valor del eje de ordenadas%
eqn=diff(h,t) == -((pi().*(d.^2).*sqrt(2.*g))./(8000)).*(1./sqrt(h)); 
                                        %ecuación diferencial%

cond=(h(0)==6); %condición inicial%

ySol(t)=dsolve(eqn,cond); %solución de la ecuación diferencial%

tic;

f=@(t,h) -((pi().*(d.^2).*sqrt(2.*g))./(8000)).*(1./sqrt(h)) ; 
                            %función handle de f(t,y)%

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
    yn(k+1)=yn(k)+dt.*f(tn(k),yn(k)); %fórmula de Euler%
end
toc;
H=20*3600;%tiempo en segundos%
dif=abs(eval(ySol(H))-yn(11));%diferencia en valor absoluto en un punto t%
                                %entre y(t) y la calculada por el método%
                               
                                
plot(tn,yn,'r','linewidth',1.3) %gráfica de y(t) por la fórmula de Euler%
hold on 
fplot(ySol(t),'b','Linewidth',1.3) %gráfica de y(t)%
xlim([0,T])
ylim([0,J])
xlabel('tiempo(s)')
grid on; grid minor;
legend({'aproximación h(t)','h(t)'},'Location','northwest')
