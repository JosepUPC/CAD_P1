%% Comunicacions Analògiques i Digitals
% Pràctica 2: Modulacions Digitals en Banda Base (II)

%% 2.1 Generació de Senyal

% 1 

% b=repmat([0 0 0 1 1 1 1 0], 1, 10);

% a_2PAM=repmat([+1 +1 +1 -1 -1 -1 -1 +1], 1, 10);

% a_4PAM=repmat([-3 -1 +1 +3], 1, 10);

% s_2PAM=0.5*[reshape( repmat(a_2PAM, 4, 1), [], 1 )' zeros(1, 3)];

% s_4PAM=0.5*[reshape( repmat(a_4PAM, 4, 1), [], 1 )' zeros(1, 3)];

%% 2.2 Canal Additiu amb Soroll Gaussià Blanc

% 2

Lw2P=length(s_2PAM);
Pw=0.01;
MeanW=0;
w=MeanW+sqrt(Pw)*randn(1,Lw2P);

% 3 Señal rebut r_2PAM:

r_2PAM=w+s_2PAM;

figure("name","Señal rebuda")

subplot(1,2,1)
plot(s_2PAM,"color",[0 0 0])
title("s_2PAM Signal")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,2,2)
plot(r_2PAM,"color",[0 0 0])
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

r_2PAM_1=w1_2P+s_2PAM;
r_2PAM_2=w2_2P+s_2PAM;

figure("Name","Señal rebuda amb diverses variancies");

subplot(1,3,1)
plot(s_2PAM)
title("s_2PAM Signal")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,3,2)
plot(r_2PAM_1)
title("s_2PAM with variance '0'")
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,3,3)
plot(r_2PAM_2)
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

r_fil_2PAM=conv(r_2PAM,H,"full");
rf2P_L=length(r_fil_2PAM);

% 6

Nss=L;
M=floor(rf2P_L/Nss);
a_reb_2PAM=zeros(1,M);

for f1=Nss:Nss:rf2P_L
    a_reb_2PAM(1,f1/Nss)=r_fil_2PAM(1,f1);
end

a2P_sz=size(a_2PAM);
a_reb_2PAM=a_reb_2PAM(1,1:a2P_sz(2));

% 7

figure("Name","Seqüencia rebuda a_reb_2PAM amb variància '0.01'");

plot(a_2PAM,"LineStyle","--","Color",[1 0 0],"LineWidth",2);
title("Comparació señal entrada/rebuda")
hold on
plot(a_reb_2PAM,"LineStyle","-","Color",[0 1 0],"LineWidth",2)
xlabel("sample")
ylabel("amplitude");
hold off

% Com es pot observar en la figura "Seqüencia rebuda a_reb_2PAM", els
% simbols rebuts son lleurerament diferents degut al valor afegit per la
% suma del soroll del vector al·leatori w.

% 8

% Señal rebuda per a Pw1=0

% 5.1

r_fil_2PAM_1=conv(r_2PAM_1,H,"full");
rf2P_L_1=length(r_fil_2PAM_1);

% 6.1

M1=floor(rf2P_L_1/Nss);
a_reb_2PAM_1=zeros(1,M1);

for f2=Nss:Nss:rf2P_L_1
    a_reb_2PAM_1(1,f2/Nss)=r_fil_2PAM_1(1,f2);
end

a2P1_sz=size(a_2PAM);
a_reb_2PAM_1=a_reb_2PAM_1(1:a2P1_sz(2));

% 7.1

figure("Name","Seqüencia rebuda a_reb_2PAM amb variancia '0'");

plot(a_2PAM,"LineStyle","-","Color",[0.5 0 0],"LineWidth",3);
title("Comparació señal entrada/rebuda")
hold on
plot(a_reb_2PAM_1,"LineStyle",":","Color",[0 0.5 0],"LineWidth",3)
xlabel("sample")
ylabel("amplitude");
hold off

% Señal rebuda per a Pw2=0.5

% 5.2

r_fil_2PAM_2=conv(r_2PAM_2,H,"full");
rf2P_L_2=length(r_fil_2PAM_2);

% 6.2

M2=floor(rf2P_L_2/Nss);
a_reb_2PAM_2=zeros(1,M2);

for f3=Nss:Nss:rf2P_L_2
    a_reb_2PAM_2(1,f3/Nss)=r_fil_2PAM_2(1,f3);
end

a2P2_sz=size(a_2PAM);
a_reb_2PAM_2=a_reb_2PAM_2(1:a2P2_sz(2));

% 7.2

figure("Name","Seqüencia rebuda a_reb_2PAM amb variancia '0.5'");

plot(a_reb_2PAM_2,"LineStyle",":","Color",[0.8 0.8 0],"LineWidth",3)

title("Comparació señal entrada/rebuda")
hold on
plot(a_2PAM,"LineStyle","-","Color",[1 0 0],"LineWidth",3);
xlabel("sample")
ylabel("amplitude");
hold off

%% 2.4 Relació Senyal-a-Soroll

% 9

% señal s_2PAM

s_fil_2PAM=conv(s_2PAM,H,"full");
sf2P_L=length(s_fil_2PAM);

Nss=L;
Ms1=floor(sf2P_L/Nss);
s_fm_2PAM=zeros(1,Ms1);

for fs1=Nss:Nss:sf2P_L
    s_fm_2PAM(1,fs1/Nss)=s_fil_2PAM(1,fs1);
end

s2P_sz=size(a_2PAM);
s_fm_2PAM=s_fm_2PAM(1,1:s2P_sz(2));

% soroll w

w_fil=conv(w,H,"full");
w_L=length(w_fil);

Nss=L;
Mf=floor(w_L/Nss);
w_fm=zeros(1,Mf);

for fw=Nss:Nss:w_L
    w_fm(1,fw/Nss)=w_fil(1,fw);
end

w_sz=size(a_2PAM);
w_fm=w_fm(1,1:w_sz(2));

% 10

s_fm_sqrt_2PAM=s_fm_2PAM.*conj(s_fm_2PAM);
Ptx=mean(s_fm_sqrt_2PAM,'all');

% 11

w_fm_fft=w_fm.*conj(w_fm);
Pww=mean(w_fm_fft,'all');

% 12

snr=Ptx/Pww;
snrdB=10*log(snr);