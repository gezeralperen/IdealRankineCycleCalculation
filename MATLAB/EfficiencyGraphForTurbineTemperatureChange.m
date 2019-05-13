%To plot Efficincy-Turbine Temperature(T3)
%Copy Paste Efficiency Calculating Code In a Loop and Take P4 as Variable
eff3 = [];

T = linspace(200, 1500, 100);

for a = 1:100
P2 = 10;
P4 = 0.7;
P3 = P2;
P1 = P4;
T3 = T(a);
h3 = XSteam('h_pT', P3, T3);
s3 = XSteam('s_pT', P3, T3);
s4 = s3;
h4 = XSteam('h_ps', P4, s4);
h1 = XSteam('hL_P', P1);
s1 = XSteam('sL_P', P1);
s2=s1;
h2 = XSteam('h_ps', P2, s2);
eff3 = [eff3 (((h1-h4)/(h3-h2))+1)];
end

figure(3);
plot(T, eff3);
xlabel('Turbine Inlet Temperature (°C)');
ylabel('Thermal Efficiency');

