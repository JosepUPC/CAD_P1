function [B] = detector4PAM(a)

% a és el vector de símbols rebut.
% b és el vector de dígits decidits.

B=1:2*length(a);
R=2/sqrt(5);

for i=2:2:2*length(a)
    if a(1,i/2)<=-R
        B(1,i-1)=0;
        B(1,i)=0;
    elseif a(1,i/2)<=0
        B(1,i-1)=0;
        B(1,i)=1;
    elseif a(1,i/2)<=R
        B(1,i-1)=1;
        B(1,i)=1;
    else
        B(1,i-1)=1;
        B(1,i)=0;
    end
end

end