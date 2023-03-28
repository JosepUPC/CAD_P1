%% Comunicacions Analògiques i Digitals
% Pràctica 2: Modulacions Digitals en Banda Base (II)

%% 2.1 Generació de Senyal

% 1 

b=repmat([0 0 0 1 1 1 1 0], 1, 10);

a_2PAM=repmat([+1 +1 +1 -1 -1 -1 -1 +1], 1, 10);

a_4PAM=repmat([-3 -1 +1 +3], 1, 10);

s_2PAM=0.5*[reshape( repmat(a_2PAM, 4, 1), [], 1 )' zeros(1, 3)];

s_4PAM=0.5*[reshape( repmat(a_4PAM, 4, 1), [], 1 )' zeros(1, 3)];

%% 2.2 Canal Additiu amb Soroll Gaussià Blanc

% 2

Lw2P=length(s_2PAM);
Pw=0.01;
MeanW=0;
w=MeanW+sqrt(Pw)*randn(1,Lw2P);

% 3 Señal rebut r_2PAM:

r_2PAM=w+s_2PAM;

subplot(1,2,1)
plot(s_2PAM)
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,2,2)
plot(r_2PAM)
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
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,3,2)
plot(r_2PAM_1)
ylim([-1, 1])
xlabel("samples")
ylabel("Amplitude");

subplot(1,3,3)
plot(r_2PAM_2)
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
f1=0;
a_reb_2PAM=r_fil_2PAM(1,1);

for f1=5:4:rf2P_L
    a_reb_2PAM=[a_reb_2PAM r_fil_2PAM(1,f1)];
end

a_reb_2PAM=a_reb_2PAM(1,3:length(a_2PAM)+2);

% 7

figure("Name","Seqüencia rebuda a_reb_2PAM");

plot(a_2PAM,"LineStyle","--","Color",[1 0 0],"LineWidth",2);

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

% Señal rebuda per a Pw2=0.5

%% 2.4 Relació Senyal-a-Soroll

