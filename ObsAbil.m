Wsys = subs(sys,tau,[0;0]);
W = jacobian([LieDerivative(Wsys,obs(1),x,0) ;LieDerivative(Wsys,obs(1),x,1);
          LieDerivative(Wsys,obs(2),x,0); LieDerivative(Wsys,obs(2),x,1)],x)