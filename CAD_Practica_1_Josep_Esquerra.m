%% Comunicacions Analògiques i Digitals
% Pràctica 1: Modulacions Digitals en Banda Base (I)

%% 1.1 Mostratge

% 1)
% Constulta el archiu "genRndSignal.m"

% 2)
% Delarar les variables per a general la seqüencia

n=0;
x=0;
N=200;
B=0.1;
K=4;
[n,x] = genRndSignal(N,B,K);

% 3)
% Per tal d'oberbar la sequencia en el domini feqüencial, hem de passar la
% señal per una funció fft() per a generar una vector amb l'espectre
% freqüencial de la señal tot mostrant-la en (DB)

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
% 4)Constulta el archiu "analogToDigital.m"

b=analogToDigital(x);

% 5)

b=b(1:80);

figure("Name","Digital");

stem(b,"filled","LineStyle","--","Color",[0.5 0.5 0])
title("Binary Sequence")
xlabel("samples")
ylabel("values[0/1]");


%% 1.3 Codificació PAM
% 6) La potencia (Pa) per a cada constelació és el sumatori de la
% porbabilita del simbol multiplicat pel valor de simbol del simbol al
% quadrat. 

% 7) Per a transmetre la señal b[n] de 80 mostres, seria necessari las
% mateixa quantitat (80) de simbols en constelació 2-PAM
% Per a transmetre la señal b[n] de 80 mostres, seria necesari la meitat
% (40) de simbols en constelació 4_PAM

% 8)
% Constulta el archiu "mapper2PAM()" i l'archiu "mapper4PAM()"

% 9)

b1=[0 1 1 0];
b2=[0 0 0 1 1 1 1 0];

b1_mod=mapper2PAM(b1);
b2_mod=mapper4PAM(b2);

% 10)

a_2PAM=mapper2PAM(b);
a_4PAM=mapper4PAM(b);

figure("Name","PAM Codification")

subplot(2,1,1)
stem(a_2PAM,"filled","Color",[0.2 0.5 0.2],"LineStyle","--");
title("2-PAM Polar");
xlabel("samples*simbol")
ylabel("value");

subplot(2,1,2)
stem(a_4PAM,"filled","Color",[0.2 0.5 0.2],"LineStyle","--");
title("4-PAM Polar");
xlabel("samples*simbol")
ylabel("value");

% 11) el 4-PAM polar es mes eficient a l'hora de transmetre més 
% bits/sample, i de forma conseqüent, mes bits/s. 

% 12) a l'hora de la detecció de simbols, és més fàcil detectar les
% constelacions 2-PAM, ja que tenen un marge de error de bit molt més gran
% (el màxim) en comparació a les constelacions 4-PAM, que en tenen el
% doble.

%% 1.4 Conformació del Pols
% 13)
% Constulta el archiu "modula.m".

% 14)

% Generació del pols
E=1;
L=5;
Mt=(-L/2:(L/2)-1);
P=rectpuls(Mt,L)*sqrt(E/L);

% Calcul de l'energia
Ep=0;
F1=0;
sum=0;
F_l1=length(P);
for F1=1:F_l1
    Ep=Ep+(P(F1)^2);
end

% Modulació de les seqüencies

s_2PAM=modula(a_2PAM,P,L);
s_4PAM=modula(a_4PAM,P,L);

% Representació en el domini temportal

figure("Name","Pulse building")
subplot(2,2,1)
stem(s_2PAM,"Color",[0.2 0.2 0.4])
title("pluse temporal domain plot")
xlabel("time")
ylabel("Amplitude(volts)")

subplot(2,2,2)
plot(s_4PAM,"Color",[0.2 0.2 0.4])
title("pluse temporal domain plot")
xlabel("time")
ylabel("Amplitude(volts)")

% Representació en el domini freqüencial

subplot(2,2,3)
plot(10*log(s_2PAM.^2),"Color",[0.2 0.2 0.5])
title("pluse frequency domain plot")
xlabel("frequency(Hz)")
ylabel("Amplitude(dB)")

subplot(2,2,4)
plot(10*log(s_4PAM.^2),"Color",[0.2 0.2 0.5])
title("pluse frequency domain plot")
xlabel("frequency(Hz)")
ylabel("Amplitude(dB)")
