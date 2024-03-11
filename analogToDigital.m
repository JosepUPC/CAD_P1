%%  FUNCTION STATEMENT
%
%
%
%%
function [ b ] = analogToDigital( x )

    partition = linspace(-2, 2, 15);
    codebook  = (0:length(partition));
    xq = quantize(x, partition, codebook);
    bq = dec2bin(xq, 4);

    b = zeros(4*length(bq), 1);
    for i = 1 : length(bq)
        for j = 1 : 4
            b(4*(i-1)+j) = str2double( bq(i, j) );
        end
    end
end


function [ iq ] = quantize( x, partition, codebook )

    iq = zeros(size(x));
    for i = 1 : length(x)
        [~, ind] = find((x(i) - partition) < 0, 1);
        if isempty(ind), iq(i) = codebook(end);
        else           , iq(i) = codebook(ind);
        end
    end

end