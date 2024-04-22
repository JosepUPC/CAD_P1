function [a] = mapper2PAM(b)
%   UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

f=length(b);
a=zeros(1,f);

for in=1:f
    a(in)=1-(2*b(in));
end