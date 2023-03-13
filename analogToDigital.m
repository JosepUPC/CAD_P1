function [b] = analogToDigital(x)
    partition = linspace(-2, 2, 15);
    codebook = [0 0 0 0 ; 0 0 0 1 ; 0 0 1 0 ; 0 0 1 1 ; ...
    0 1 0 0 ; 0 1 0 1 ; 0 1 1 0 ; 0 1 1 1 ; ...
    1 0 0 0 ; 1 0 0 1 ; 1 0 1 0 ; 1 0 1 1 ; ...
    1 1 0 0 ; 1 1 0 1 ; 1 1 1 0 ; 1 1 1 1 ];
    b = zeros(4*length(x), 1);
    for i = 1:length(x)
        [a, ind] = find((x(i) - partition) < 0, 1);
        if isempty(ind) 
            b((1:4)+4*(i-1)) = codebook(16, :);
        else 
            b((1:4)+4*(i-1)) = codebook(ind, :);
        end
    end
end