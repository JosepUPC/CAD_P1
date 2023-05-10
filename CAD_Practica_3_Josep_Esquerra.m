%% Comunicacions Analògiques i Digitals
% Pràctica 3: Detector de Símbol 2-PAM (III)

% variables de l'anterior pràctica necessaris: b, a_2PAM, a_reb_2PAM, 
% a_4PAM, a_reb_4PAM

% 3.1 Detector de Símbol 2-PAM

% 1 consulti la funció detector2PAM.m comparitida

% 2

b_est_2PAM = detector2PAM(a_reb_2PAM);

% 3

figure("Name","Comparació entrada/sortida 2PAM amb variancia Pw=0.01")

stem(b, "LineStyle","-","LineWidth",1,"Color",[1 0 0])

hold on
title("comparació entrada del sistema b amb sortida b_est_2PAM")
stem(b_est_2PAM,"LineStyle","--","LineWidth",1.5,"Color",[0 1 0]);
xlabel("samples")
ylabel("bit value")
hold off

% 4 
% 4.1

b_est_2PAM_1 = detector2PAM(a_reb_2PAM_1);

figure("Name","Comparació entrada/sortida 2PAM amb variancia Pw=0")

stem(b, "LineStyle","-","LineWidth",1,"Color",[1 0 0])

hold on
title("comparació entrada del sistema b amb sortida b_est_2PAM_1")
stem(b_est_2PAM_1,"LineStyle","--","LineWidth",1.5,"Color",[0 0.5 0]);
xlabel("samples")
ylabel("bit value")
hold off

% 4.2

b_est_2PAM_2 = detector2PAM(a_reb_2PAM_2);

figure("Name","Comparació entrada/sortida 2PAM amb variancia Pw=0.5")

stem(b, "LineStyle","-","LineWidth",1,"Color",[1 0 0])

hold on
title("comparació entrada del sistema b amb sortida b_est_2PAM_2")
stem(b_est_2PAM_2,"LineStyle","--","LineWidth",1.5,"Color",[0 0.25 0]);
xlabel("samples")
ylabel("bit value")
hold off

% 4.3 És raonable afirmara que els unics parametres que poden afectar a la
% semblança dels dos vectors son els factors ambientals, les variables
% aleatories i la mitjana del soroll rebut en la transmission de la señal.

% 3.1 Detector de Símbol 4-PAM

% 5 consulti la funció detector2PAM.m comparitida

% 6

b_est_4PAM = detector4PAM(a_reb_4PAM);

% 7

figure("Name","Comparació entrada/sortida 4PAM amb variancia Pw=0.01")

stem(b, "LineStyle","-","LineWidth",1,"Color",[1 0 0])

hold on
title("comparació entrada del sistema b amb sortida b_est_4PAM")
stem(b_est_4PAM,"LineStyle","--","LineWidth",1.5,"Color",[0 1 0]);
xlabel("samples")
ylabel("bit value")
hold off

% 8 la probabilitat d'error de bit de la 2PAM es molt menor que la que 
% podria tindre la 4PAM, ya que el marge d'error d'una es més gran que
% l'altre.

% 9 Pa = p1*power(abs(a1),2) + p2*power(abs(a1),2) =
% = p1 * power(abs(-A/2),2) + p2 * power(abs(A/2),2) =
% = (p1 + p2) * power(A,2) / 4 = power(A,2)/4

A=2;
Pa=power(A,2)/2;

% 10 la potencia del soroll depend de la variancia del soroll, ja que la
% seva mitjana es '0'. Per tant, la viarianca Pw=Pa/snr;

% 11 consulti la funció calcularErrors2PAM comparitida

% 12 

Nd=100000;
snr=8;
[der,ser]=calcularErrors2PAM(Nd,snr);

% 13

derv=1:10;
serv=1:10;
i2=0;

for i2=1:10
    [derv(i2),serv(i2)]=calcularErrors2PAM(Nd,i2);
end

figure("Name","Corba error de bit 2PAM")
stem(derv);
figure("Name","Corba error de símbol 2PAM")
stem(serv);

% 14

% referencia a la relació señal a sorol de l'apartat 12
c1=qfunc(sqrt(8));

compPAM2=[der ser c1];
cPAM2l=20*log10(compPAM2);

figure("Name","Sobreposició de resultats teórics 2PAM");
stem(cPAM2l);

% 15

% 15.1

Nd=100000;
snr=8;
[der4,ser4]=calcularErrors4PAM(Nd,snr);

% 15.2

derv4=1:10;
serv4=1:10;
i2=0;

for i2=1:10
    [derv4(i2),serv4(i2)]=calcularErrors4PAM(Nd,i2);
end

figure("Name","Corba error de bit 4PAM")
stem(derv4);
figure("Name","Corba error de símbol 4PAM")
stem(serv4);

% 15.3

c2=(3/2)*qfunc(sqrt((snr*3)/15));

compPAM4=[der4 ser4 c2];
cPAM4l=20*log10(compPAM4);

figure("Name","Sobreposició de resultats teórics 4PAM");
stem(cPAM4l);