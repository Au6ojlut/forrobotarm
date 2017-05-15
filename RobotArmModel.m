clear all
syms q1 q2 dotq1 dotq2 tau1 tau2
%syms m1 m2 lc1 lc2 I1 I2 l1 l2  t1 t2 t3 t4 t5 g
m1 = 1; m2 = 1;
lc1 = 0.5; lc2 = 0.5;
I1 = 0.12; I2 = 0.12;
l1 = 1; l2 = 1;
g=10;
q = [q1;q2]; dotq = [dotq1; dotq2]; tau = [tau1; tau2];

m = [m1;m2]; lc = [lc1;lc2]; I = [I1;I2]; l = [l1;l2];

theta = [m(1)*lc(1)^2 + m(2)*l(1)^2 + I(1); m(2) * lc(2)^2 + I(2); m(2)*l(1)*lc(2); m(1)*lc(1) + m(2)*l(1); m(2)*lc(2)]; 

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

%creating file that will calculate rigth side of system
string{1} = 'function X = RobotSystem(t,x,u)';
string{2} = 'q1 = x(1); dotq1 = x(2); q2 = x(3); dotq2 = x(4); tau1 = u(1); tau2 = u(2);'; %define parametrs
string{3} = ['X(1) = ' vectorize(sys(1)) ';']; %define function
string{4} = ['X(2) = ' vectorize(sys(2)) ';'];
string{5} = ['X(3) = ' vectorize(sys(3)) ';'];
string{6} = ['X(4) = ' vectorize(sys(4)) ';'];
string{7} = ['X = X'';'];
openedfile = fullfile(pwd, 'RobotSystem.m');%change way if needed
fid = fopen(openedfile, 'w');
fprintf(fid, '%s\n', string{:});
fclose(fid);
