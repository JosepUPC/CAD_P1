function [inT] = function_Default(in1,in2)
    if nargin < 1
        in1 = 5;
    end
    if nargin < 2
        in2 = 2;
    end
    inT=in1+in2;
end