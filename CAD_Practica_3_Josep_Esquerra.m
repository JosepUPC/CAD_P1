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