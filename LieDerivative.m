function y = LieDerivative(f,h,basis,n)
if nargin < 4
    n = 1;
end
if n == 0
    y = h;
else    
    liederivative = sym(zeros(n+1,length(h)));
    liederivative(1,:) = h;
    for k=2:n+1
        liederivative(k,:) = jacobian(liederivative(k-1,:).',basis) * f;
    end
    y = liederivative(n+1,:).';
end

end

