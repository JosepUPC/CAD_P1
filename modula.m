function [s] = modula(a,p,Nss)

% Primera Part
at=upsample(a,Nss);

% Segona Part
s=conv(at,p);

end