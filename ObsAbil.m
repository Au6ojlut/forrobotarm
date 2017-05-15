
W = jacobian([LieDerivative(sys,obs(1),x,0) ;LieDerivative(sys,obs(1),x,1);
          LieDerivative(sys,obs(2),x,0); LieDerivative(sys,obs(2),x,1)],x)