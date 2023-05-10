function [B] = detector2PAM(a)

% a és el vector de símbols rebut.
% b és el vector de dígits decidits.

i=0;
B=[1:length(a)];

for i=1:length(a)
    if a(1,i)>=0
        B(1,i)=1;
    else
        B(1,i)=0;
    end
end

end