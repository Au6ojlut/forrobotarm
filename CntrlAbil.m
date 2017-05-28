Asys = subs(sys,tau,[0;0]);
Bsys1 = diff(sys,'tau1');  Bsys2 = diff(sys,'tau2');
rank([Bsys1,Bsys2,LieBrackets(Asys,Bsys1,x),LieBrackets(Asys,Bsys2,x),LieBrackets(Asys,Bsys1,x,2),LieBrackets(Asys,Bsys2,x,2),LieBrackets(Asys,Bsys1,x,3),LieBrackets(Asys,Bsys2,x,3)])