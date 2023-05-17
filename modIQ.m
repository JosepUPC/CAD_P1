function [ s ] = modIQ( is, qs, fc, t )

% is és la component en fase.
% qs és la component en quadratura.
% fc és la freqüència de la portadora.
% t és el vector de temps.
% s és el senyal modulat.

C=cos(2*pi*fc*t);
S=sin(2*pi*fc*t);
si=is.*C;
sq=qs.*S;
s=si+sq;

end