function [s] = modula(a,p,Nss)

% Primera Part
at=0;
at=upsample(a,Nss);

% Segona Part
s=conv(a,p);

end