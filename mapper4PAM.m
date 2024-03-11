function [a] = mapper4PAM(b)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

forin=length(b);
a=zeros(1,forin/2);

for in=2:2:forin
    if b(in)==0
        val=3/sqrt(5);
    else
        val=1/sqrt(5);
    end
    if b(in-1)==0
        sib=-1;
    else
        sib=1;
    end
    a(in/2)=sib*val;
end