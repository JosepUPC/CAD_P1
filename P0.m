%% Ex 1. 
% la funció zeros() retorna un vector de '0'

N1=10;
x1=zeros(1,N1);
%% Ex 2.
% la funció ones() retorna un vector de un valor determinat

N2=5;
x2=ones(1,N2);
%% Ex 3.
% la funció rand() retorna un vector de numeros al atzar
x3=rand(1,1);
%% Ex 4.
x4=10*rand(1,1);
%% Ex 5.
x5=20*rand(1,1)-10;
%% Ex 6.
N6=20;
x6=rand(1,N6);
x6(13)
%% Ex 7.
%figure
%figure
%figure
%% Ex 8.
%figure genera una nova figura, "subplot" genera un conjunt de finestres a
%la figura depenent de la mida i el numero aquestes 
figure
subplot(2,1,1)
plot(x6)
subplot(2,1,2)
stem(x6)
%% Ex 9.
%abs() retorna el valor absolut y angle() angle en radiants
x9=2+3j;
abs(x9)
angle(x9)
angle(x9)*180/pi
%% Ex 10.
%multiplica els mateixos numeros de dos vectors (.^)
x10=x6.^x6;
%% Ex 11.
N11=1024;
fs=900;
fx=100;

T=[0:1/fs:(N1-1)*1/fs];
x11=cos(2*pi*fx*T);

figure
plot(T,x11)
%% Ex 12.
%ftt() retorna el aspectre freqüencial en transformada de fourier
Npoints=1024;
x12=fft(x11,Npoints);
%% Ex 13.
%% Ex 14.
figure
subplot(2,3,2)
    stem(x11)
    title("Cosinus x11")
subplot(2,3,5)
    stem(x12)
    title("Fast Fourier Transformer x12")
%% Ex 15.
figure
fx=300;
x15=cos(2*pi*fx*T);
subplot(2,3,2)
    stem(x15)
    title("Cosinus x15")
x15f=fft(x15,Npoints);
subplot(2,3,5)
    stem(x15f)
    title("Fast Fourier Transformer x15")
%% Ex 16.
% makedist() genera una normal gausiana amb parametre "mu" i "sigma".
% Random() retrona un vector amb un certs parametres de objecte. 
% mean() torna la mitjana del objecte
%var() torna la variancia del objecte
N16=1000;
pd16=makedist('Normal','mu',10,'sigma',1);
x16=random(pd16,N16);
mean(pd16)
var(pd16)
%% Ex 17.
N17=1000;
pd17=makedist('Normal','mu',10,'sigma',2);
x17=random(pd17,N17);
mean(pd17)
var(pd17)
%% Ex 18.
% al afegir una variable mes, és creara un vector
N18=2048;
M18=8;
pd18=makedist('Normal','sigma',1,'mu',0);
x16=random(pd18,N18,M18);
%% Ex 19.
% delcarar una variable zero para el for
In=0;
t=[0:1/10:(N18-1)*1/10];
figure
for In=1:M18
    subplot(3,3,In)
    stem(t,x16(1:N18,In))
    title("matrix x16, column "+string(In))
    xlabel("longitud("+string(N18)+")")
    ylabel("normal distribution values("+string(In)+")")
end
%% Ex 20.
% colon() genera un vector tenint en compte uns parametres
x20=colon(1,2,100);
%% Ex 21.
x21=colon(1,5,100);
%% Ex 22.
% genera un pols rectangular amb rectpuls() i una convolució amb conv()
L=10;
t22=(-5:L-6);
p22=rectpuls(t22,4);
x22=conv(p22,p22,"full");
figure
stem(x22)
title("double rectangle pulse convolution")
xlabel("samples")
ylabel("Amplitud")
%% Ex 23.
t23=(-1:2/(1e4):1);
p23=rectpuls(t23);

figure
subplot(1,2,1)
plot(t23,p23)
title("rectangular pulse")

x22=conv(p23,p23,"full");
D=t23(2)-t23(1);
A=x22*D;
t23A=(-2:4/(2*1e4):2);
subplot(1,2,2)
plot(t23A,A)
title("Autocorrelación");