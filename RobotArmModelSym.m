clear all
syms q1 q2 dotq1 dotq2 tau1 tau2
syms m1 m2 lc1 lc2 I1 I2 l1 l2  t1 t2 t3 t4 t5 g
q = [q1;q2]; dotq = [dotq1; dotq2]; tau = [tau1; tau2];

m = [m1;m2]; lc = [lc1;lc2]; I = [I1;I2]; l = [l1;l2];

theta = [m(1)*lc(1)^2 + m(2)*l(1)^2 + I(1); m(2) * lc(2)^2 + I(2); m(2)*l(1)*lc(2); m(1)*lc(1) + m(2)*l(1); m(2)*lc(2)]; 
%theta = [t1,t2,t3,t4,t5]; 

H = [theta(1) + theta(2) + 2 * theta(3)*cos(q(2)), theta(2) + theta(3) * cos(q(2));
    theta(2) + theta(3) * cos(q(2)), theta(2)]; 

C = [-theta(3) * sin(q(2)) * dotq(2), -theta(3) * sin(q(2)) * dotq(2) - theta(3) * sin(q(2)) * dotq(1);
    theta(3) * sin(q(2)) * dotq(1), 0];

G = [ theta(4) * g * cos(q(1)) + theta(5) * g * cos(q(1) + q(2)); theta(5) * g * cos(q(1) + q(2))]; %nonhorizontal robotarm

InvH = H^(-1);
Asys = InvH * (-C * dotq - G );
tmpsys = Asys + InvH*tau;
sys = [dotq(1);tmpsys(1);dotq(2);tmpsys(2)];

x = [q(1);dotq(1);q(2) ;dotq(2)];


Cx = [1 0 0 0; 0 0 1 0];

obs = Cx * x;

