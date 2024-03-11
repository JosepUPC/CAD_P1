% ex 1
N1 = 10;
x1 = zeros(1,N1);
% ex 2
N2 = 10;
x2 = ones(1,N2);
% ex 3
x3 = rand(1,1);
% ex 4
x4 = rand(1,1)*10;
% ex 5
x5 = (rand (1,1)-0.5)*20;
% ex 6
N6 = 20;
x6 = rand(1,N6);
x6(1,13)
% ex 7
figure("Name","first")
figure("Name","Second")
figure("Name","third")
close all
% ex 8
figure("Name","x6")
subplot(2,1,1)
plot(x6,"color",[1 0.3 0.3])
xlabel("numbers")
ylabel("values")
subplot(2,1,2)
stem(x6,"color",[0.3 1 0.3])
xlabel("values")
ylabel("values")
% ex 9
x9=2+3j;
abs(x9)
angle(x9)
angle(x9)*360/(pi*2);
% ex 10
x10=x6.^x6;
% 11
N11=1024;
fs=900;
fx=100;

T=[0:N11]*1/fs;
x11=cos(2*pi*fx*T);

figure("Name","x11")
plot(T,x11,"color",[0.5 0.8 0.5])
xlabel("time")
ylabel("amplitude")