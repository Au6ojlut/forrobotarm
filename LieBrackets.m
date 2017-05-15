function y = LieBrackets(f,g,basis,n,p)
if nargin < 4
    n = 1;
end
if n == 0
    y = g;
else
    liebracket = sym(zeros(n+1,length(g)));
    liebracket(1,:) = g;    
    for k = 2:n+1
        liebracket(k,:) = LieDerivative(f,liebracket(k-1,:).',basis) - LieDerivative(liebracket(k-1,:).',f,basis);
    end
    if (nargin <5)
    y = liebracket(n+1,:).';
    else        
    y = liebracket;
    end
end

end