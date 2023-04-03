%% Comunicacions Analògiques i Digitals
% Pràctica 2: Modulacions Digitals en Banda Base (II)
% Casos per a a_4PAM y s_4PAM

%% 2.1 Generació de Senyal

% 1 

b=repmat([0 0 0 1 1 1 1 0], 1, 10);

a_4PAM=repmat([-3 -1 +1 +3], 1, 10);

s_4PAM=0.5*[reshape( repmat(a_4PAM, 4, 1), [], 1 )' zeros(1, 3)];

%% 2.2 Canal Additiu amb Soroll Gaussià Blanc

% 2

Lw2P=length(s_4PAM);
Pw=0.01;
MeanW=0;
w=MeanW+sqrt(Pw)*randn(1,Lw2P);

% 3 Señal rebut r_2PAM:

r_4PAM=w+s_4PAM;

figure("name","Señal rebuda")

subplot(1,2,1)
plot(s_4PAM,"color",[0 0 0])
title("s_2PAM Signal")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,2,2)
plot(r_4PAM,"color",[0 0 0])
title("r_2PAM Signal")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

% 4

Pw1=0;
Pw2=0.5;
MeanW=0;
w1_2P=MeanW+sqrt(Pw1)*randn(1,Lw2P);
w2_2P=MeanW+sqrt(Pw2)*randn(1,Lw2P);

r_4PAM_1=w1_2P+s_4PAM;
r_4PAM_2=w2_2P+s_4PAM;

figure("Name","Señal rebuda amb diverses variancies");

subplot(1,3,1)
plot(s_4PAM)
title("s_2PAM Signal")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,3,2)
plot(r_4PAM_1)
title("s_2PAM with variance '0'")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,3,3)
plot(r_4PAM_2)
title("s_2PAM with variance '0.5'")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

% Com es pot comprobar en la figura "Señal rebuda amb diverses variancies",
% com afecta la variancia del soroll a la señal s_2PAM. Com més gran sigui,
% més difícil ens serà poder recuperar els valors en bit de cada simbol.

%% 2.3 Filtrat Adaptat i Mostratge Òptim

% Generació del pols
E=1;
L=4;
Mt=(0:L);
P=rectpuls(Mt,L*2)*sqrt(E/L);
H=P;

% 5

r_fil_4PAM=conv(r_4PAM,H,"full");
rf4P_L=length(r_fil_4PAM);

% 6

Nss=L;
f1=0;
M=floor(rf4P_L/Nss);
a_reb_4PAM=zeros(1,M);

for f1=Nss:Nss:rf4P_L
    a_reb_4PAM(1,f1/Nss)=r_fil_4PAM(1,f1);
end

a4P_sz=size(a_4PAM);
a_reb_4PAM=a_reb_4PAM(1,1:a4P_sz(2));

% 7

figure("Name","Seqüencia rebuda a_reb_2PAM amb variància '0.01'");

plot(a_4PAM,"LineStyle","--","Color",[1 0 0],"LineWidth",2);
title("Comparació señal entrada/rebuda")
hold on
plot(a_reb_4PAM,"LineStyle","-","Color",[0 1 0],"LineWidth",2)
xlabel("sample")
ylabel("amplitude");
hold off

% Com es pot observar en la figura "Seqüencia rebuda a_reb_2PAM", els
% simbols rebuts son lleurerament diferents degut al valor afegit per la
% suma del soroll del vector al·leatori w.

% 8

% Señal rebuda per a Pw1=0

% 5.1

r_fil_4PAM_1=conv(r_4PAM_1,H,"full");
rf4P_L_1=length(r_fil_4PAM_1);

% 6.1

f2=0;
M1=floor(rf4P_L_1/Nss);
a_reb_4PAM_1=zeros(1,M1);

for f2=Nss:Nss:rf4P_L_1
    a_reb_4PAM_1(1,f2/Nss)=r_fil_4PAM_1(1,f2);
end

a4P1_sz=size(a_4PAM);
a_reb_4PAM_1=a_reb_4PAM_1(1:a4P1_sz(2));

% 7.1

figure("Name","Seqüencia rebuda a_reb_2PAM amb variancia '0'");

plot(a_4PAM,"LineStyle","-","Color",[0.5 0 0],"LineWidth",3);
title("Comparació señal entrada/rebuda")
hold on
plot(a_reb_4PAM_1,"LineStyle",":","Color",[0 0.5 0],"LineWidth",3)
xlabel("sample")
ylabel("amplitude");
hold off

% Señal rebuda per a Pw2=0.5

% 5.2

r_fil_4PAM_2=conv(r_4PAM_2,H,"full");
rf4P_L_2=length(r_fil_4PAM_2);

% 6.2

f3=0;
M2=floor(rf4P_L_2/Nss);
a_reb_4PAM_2=zeros(1,M2);

for f3=Nss:Nss:rf4P_L_2
    a_reb_4PAM_2(1,f3/Nss)=r_fil_4PAM_2(1,f3);
end

a4P2_sz=size(a_4PAM);
a_reb_4PAM_2=a_reb_4PAM_2(1:a4P2_sz(2));

% 7.2

figure("Name","Seqüencia rebuda a_reb_2PAM amb variancia '0.5'");

plot(a_reb_4PAM_2,"LineStyle",":","Color",[0.8 0.8 0],"LineWidth",3)

title("Comparació señal entrada/rebuda")
hold on
plot(a_4PAM,"LineStyle","-","Color",[1 0 0],"LineWidth",3);
xlabel("sample")
ylabel("amplitude");
hold off

%% 2.4 Relació Senyal-a-Soroll

% 9

% señal s_2PAM

s_fil_4PAM=conv(s_4PAM,H,"full");
sf4P_L=length(s_fil_4PAM);

Nss=L;
fs1=0;
Ms1=floor(sf4P_L/Nss);
s_fm_4PAM=zeros(1,Ms1);

for fs1=Nss:Nss:sf4P_L
    s_fm_4PAM(1,fs1/Nss)=s_fil_4PAM(1,fs1);
end

s4P_sz=size(a_4PAM);
s_fm_4PAM=s_fm_4PAM(1,1:s4P_sz(2));

% soroll w

w_fil=conv(w,H,"full");
w_L=length(w_fil);

Nss=L;
fw=0;
Mf=floor(w_L/Nss);
w_fm=zeros(1,Mf);

for fw=Nss:Nss:w_L
    w_fm(1,fw/Nss)=w_fil(1,fw);
end

w_sz=size(a_4PAM);
w_fm=w_fm(1,1:w_sz(2));

% 10

s_fm_sqrt_4PAM=s_fm_4PAM.*conj(s_fm_4PAM);
Ptx4=mean(s_fm_sqrt_4PAM,'all');

% 11

w_fm_fft=w_fm.*conj(w_fm);
Pww4=mean(w_fm_fft,'all');

% 12

snr4=Ptx4/Pww4;
snrdB=10*log(snr4);