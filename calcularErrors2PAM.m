function [ ser, ber ] = calcularErrors2PAM( N, snr )

% N és la longitud vector binari transmès.
% snr és la relació senyal-a-soroll.
% ser és la probabilitat d’error de símbol calculada.
% ber és la probabilitat d’error de bit calculada.

% 1. Generació d’un vector binari de N dígits.

R = randn(1,N);
i=0;
for i=1:N
    if R(1,i)<=0.5
        R(1,i)=0;
    else 
        R(1,i)=1;
    end
end

% 2. Codificació 2-PAM del vector binari.

R_2PAM=mapper2PAM(R);

% 3. Generació d’un vector de soroll Gaussià amb variància Pw.

R2P=length(R_2PAM);
Pa=1;
Pwr=Pa/snr;
MeanR=0;
w=MeanR+sqrt(Pwr)*randn(1,R2P);

% 4. Càlcul de la seqüència rebuda.

R2=R_2PAM+w;

% 5. Detecció 2-PAM de la seqüència rebuda.

R2_d=detector2PAM(R2);

% 6. Càlcul del nombre de símbols i de bits erròniament decidits.

[berN,ber] = biterr(R,R2_d);
[serN,ser] = symerr(R,R2_d);

% 7. Càlcul de les respectives probabilitats d’error.

end