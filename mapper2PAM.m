function [a] = mapper2PAM(b)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
in=0;
forin=length(b);
a=zeros(1,forin);

for in=1:forin
    a(in)=-1+(2*b(in));
end