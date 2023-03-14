function [n,x] = genRndSignal(N,B,K)

% N és el nombre de mostres.
% B és el paràmetre que controla l’ample de banda.
% K és el nombre de sinusoides superposades.
% n és el vector columna 1,2,...,N.
% x és un vector columna de N mostres.

in=0;
x=0;
n=[0:N-1];
A_makedist=makedist("Uniform","lower",0,"upper",1);
A_sub_K=rand(A_makedist,1);
F_makedist=makedist("Uniform","lower",0,"upper",B);
F_sub_K=rand(F_makedist,1);
Omega_makedist=makedist("Uniform","lower",0,"upper",2*pi);
Omega_sub_K=rand(Omega_makedist,1);

for in=1:K
    x=x+(A_sub_K*cos(2*pi*n*F_sub_K+Omega_sub_K));
end
end