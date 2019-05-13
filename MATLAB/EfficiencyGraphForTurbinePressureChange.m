%To plot Efficincy-Turbine Inlet Pressure(P2/P3)
%Copy Paste Efficiency Calculating Code In a Loop and Take P2 as Variable
eff1 = [];

P2 = linspace(0.7, 150, 1000);

for a = 1:1000
P3 = P2(a);
P4 = 0.7;
P1 = P4;
T3 = 700;
h3 = XSteam('h_pT', P3, T3);
s3 = XSteam('s_pT', P3, T3);
s4 = s3;
h4 = XSteam('h_ps', P4, s4);
h1 = XSteam('hL_P', P1);
s1 = XSteam('sL_P', P1);
s2=s1;
h2 = XSteam('h_ps', P2(a), s2);
eff1 = [eff1 (((h1-h4)/(h3-h2))+1)];
end

plot(P2, eff1);
xlabel('Turbine Inlet Pressure (bar)');
ylabel('Thermal Efficiency');