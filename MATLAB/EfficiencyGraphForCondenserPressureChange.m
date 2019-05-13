%To plot Efficincy-Condenser Pressure(P1/P4)
%Copy Paste Efficiency Calculating Code In a Loop and Take P4 as Variable
eff2 = [];

P4 = linspace(0.01, 10, 100);

for a = 1:100
P2 = 10;
P3 = P2;
P1 = P4(a);
T3 = 700;
h3 = XSteam('h_pT', P3, T3);
s3 = XSteam('s_pT', P3, T3);
s4 = s3;
h4 = XSteam('h_ps', P4(a), s4);
h1 = XSteam('hL_P', P1);
s1 = XSteam('sL_P', P1);
s2=s1;
h2 = XSteam('h_ps', P2, s2);
eff2 = [eff2 (((h1-h4)/(h3-h2))+1)];
end

figure(3);
plot(P4, eff2);
xlabel('Condenser Pressure (bar)');
ylabel('Thermal Efficiency');

