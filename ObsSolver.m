%solve
syms ph
syms hi1 hi2 hi3 hi4
hi = [hi1; hi2; hi3; hi4];
LieDeriN =  [LieDerivative(sys,obs,x,0),LieDerivative(sys,obs,x),LieDerivative(sys,obs,x,2),LieDerivative(sys,obs,x,3)];
%LieDeriN = simplify(LieDeriN);
%rank(jacobian(answ,x))
myW = jacobian(LieDeriN,x);
B1 = myW^(-1) * [0; 0; 0; ph];

allBrackets = LieBrackets(Ax,B1,x,4,1);

for i = 1:4
    disp(LieBrackets( allBrackets(i), allBrackets(i+1),x))
end


%B2(4) =- ph * myW(3,2) / (myW(3,4) - myW(3,3) + myW(3,2)*(myW(4,3) - myW(4,4)));
%B2(2) =(myW(3,4)-myW(3,3))*B2(3) / myW(3,2);
%B2(1) = -B2(2);
%B3 =simplify( [B2(1); B2(2);B2(3);B2(4)]);
%what = myW*B3;
%what2 = myW*B1;

%Fi = allBrackets(1:4,:);
%newFunction = double(subs(Fi,x,[1;1;0;0]))* hi;