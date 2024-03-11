function [n,x] = genRndSignal(N,B,K)
    
    % N és el nombre de mostres.
    % B és el paràmetre que controla l’ample de banda.
    % K és el nombre de sinusoides superposades.
    % n és el vector columna 1,2,...,N.
    % x és un vector columna de N mostres.
    
    x=zeros(1,N);
    n=1:N;
    
    for in=1:K
       A_sub_K=rand(1,1);
       F_sub_K=rand(1,1)*B;
       Omega_sub_K=rand(1,1)*2*pi;
       x=x+(A_sub_K*cos(2*pi*n*F_sub_K+Omega_sub_K));
    end
end