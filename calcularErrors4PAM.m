function [ ser, ber ] = calcularErrors4PAM( N, snr )

% N és la longitud vector binari transmès.
% snr és la relació senyal-a-soroll.
% ser és la probabilitat d’error de símbol calculada.
% ber és la probabilitat d’error de bit calculada.

% 1. Generació d’un vector binari de N dígits.

R = rand(1,N);
R = R-0.5;
i=0;
for i=1:N
    if R(1,i)<=0
        R(1,i)=0;
    else 
        R(1,i)=1;
    end
end

% 2. Codificació 2-PAM del vector binari.

R_4PAM=mapper4PAM(R);

% 3. Generació d’un vector de soroll Gaussià amb variància Pw.

R4P=length(R_4PAM);
Pa=1;
Pwr=Pa/snr;
MeanR=0;
w=MeanR+sqrt(Pwr)*randn(1,R4P);

% 4. Càlcul de la seqüència rebuda.

R4=R_4PAM+w;

% 5. Detecció 2-PAM de la seqüència rebuda.

R4_d=detector4PAM(R4);

% 6. Càlcul del nombre de símbols i de bits erròniament decidits.

[berN,ber] = biterr(R4_d,R);
[serN,ser] = symerr(R4_d,R);

% 7. Càlcul de les respectives probabilitats d’error.

end