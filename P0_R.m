% netejar el workspace a l'hora detornar a activar la funció
clear all
% tamany de vector 
N = 1024;
% genera un vector de zeros de longitud N
x = zeros(1,N);
% general una matriu de N files i 3 columnes
y = ones (N,3);
% generem la frequencia de mostratge
fs = 1e4;
% generem la freuqencia de la senyal
f0 = 200;
% generem el vector de temps
t = [0:(N-1)]*(1/fs);
% genero la amplitud de la senyal
A = 2;
% genero la senyal
x = A*cos(2*pi*f0*t);

% com generar un senyal amb soroll??
r = rand(1,10);
rn = randn(1,10);

% mostrem la senyal per pantalla
figure("Name","Signal")
plot(t,x,"Color",[1 0 0],"LineStyle","-","DisplayName","signal")
xlabel("time");
ylabel("amplitude");

% generem el señal del soroll i el mostrem per pantalla
w = sqrt(0.03)*randn(1,N);
figure("Name","random noise")
plot(t,w,"Color",[0 1 0])
xlabel("time")
ylabel("amplitude")
close all

%generem la suma de les senyals
y = 0.1*x + w;

figure("Name","MixOfSignals")
subplot(221)
plot(t,x,"Color",[1 0.3 0.3])
xlabel("time")
ylabel("amplitude");
subplot(222)
plot(t,w,"color",[0.3 1 0.3])
xlabel("time")
ylabel("amplitude");
subplot(212)
xlabel("time")
ylabel("amplitude");
plot(t,y,"color",[0.3 0.3 1]);