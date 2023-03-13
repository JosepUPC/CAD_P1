%% 1.1 Mostratge

n=0;
x=0;
N=200;
B=0.1;
K=4;

[n,x] = genRndSignal(N,B,K);
xfft=fft(x);
xfft=10*log10(xfft.^2);

figure("Name","Sample");

subplot(2,1,1)
plot(n,x)
title("sequence temporal domain plot")
xlabel("time(s)")
ylabel("Amplitude(volts)");

subplot(2,1,2)
plot(n,xfft)
title("sequence frequency domain plot")
xlabel("frequency(Hz)")
ylabel("Amplitude(dB)");

%% 1.2 Digitalització

b=analogToDigital(x);
b=b(1:80);

figure("Name","Digital");

stem(b,"filled","LineStyle","--","Color",[0.5 0.5 0])
title("Binary Sequence")
xlabel("samples")
ylabel("values[0/1]");

%% Codificació PAM

% 6) Teóricament el potencial de cada simbol de un sistema 
% 2-PAM Polar es de 0.5 la potencia de la señal i el sistema 
% en 4-PAM Polar és de 0.25 el multiple de la potencia de cadascun
% dels seus simbols.

% 7) És necessiten 80 simbols per a transmetre en sistema 2-PAM Polar
% és necessiten 40 simbols per a transmetre en sistema 4-PAM Polar

b1=[0 1 1 0];
b2=[0 0 0 1 1 1 1 0];

b1_mod=mapper2PAM(b1);
b2_mod=mapper4PAM(b2);

a_2PAM=mapper2PAM(b);
a_4PAM=mapper4PAM(b);

figure("Name","PAM Codification")
subplot(2,1,1)
stem(a_2PAM,"filled","Color",[0.2 1 0.2],"LineStyle","--");
title("2-PAM Polar");
xlabel("samples*simbol")
ylabel("value");

subplot(2,1,2)
stem(a_4PAM,"filled","Color",[0.2 1 0.2],"LineStyle","--");
title("4-PAM Polar");
xlabel("samples*simbol")
ylabel("value");

% 11) el 4-PAM polar es mes eficient a lora de transmetre més bits/sample, i de
% forma conseqüent, mes bits/s. 

% 12) a l'hora de detectar dels simbols es fés fàcil detectar les
% constelacions 2-PAM, ja que tenen un marge de error de bit molt més gran
% (el màxim) en comparació a les constelacions 4-PAM.

%% Conformació del Pols

