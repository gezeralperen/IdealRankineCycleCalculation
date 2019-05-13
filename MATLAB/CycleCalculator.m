%Boiler Pressure
P2 = 10;
P3 = P2;

%Condenser Pressure
P4 = 0.7;
P1 = P4;

%Turbine Temperature
T3 = 700;

%find h values from xSteam

%First find h and s values for Turbine Inlet/Boiler Outlet.
h3 = XSteam('h_pT', P3, T3);
s3 = XSteam('s_pT', P3, T3);

%S values are same as Turbine is isentropic
s4 = s3;

%h value for Turbine Outlet/Condenser Inlet
h4 = XSteam('h_ps', P4, s4);

%At the exit of the condenser P stays same and fluid becomes saturated
%liquid. Thus we use Satured Liquid model
h1 = XSteam('hL_P', P1);
s1 = XSteam('sL_P', P1);

%Pump is isentropic too. So, s values are equal.
s2=s1;
h2 = XSteam('h_ps', P2, s2);

efficiency = ((h1-h4)/(h3-h2))+1;
Wturb = h3-h4;
Wpump = h2-h1;
Qin = h3-h2;
Qout = h4-h1;

%Plotting T-S Diagram
%For 1-2 S is constant
s12 = [s1,s2];
T1 = XSteam('T_ph', P1, h1);
T2 = XSteam('T_ph', P2, h2);
T12 = [T1,T2];

%For 2-3 Pressure is constant
s23 = linspace(s2,s3,100);
T23 = [T2];

for a = 2:100
    s= s23(a);
    T23 = [T23 XSteam('T_ps', P2, s)];
end

%For 3-4 S is constant
s34 = [s3, s4];
T3 = XSteam('T_ph', P3, h3);
T4 = XSteam('T_ph', P4, h4);
T34 = [T3,T4];

%For 4-1 Pressure is constant
s41 = linspace(s4,s1,100);
T41 = [T4];

for a = 2:100
    s= s41(a);
    T41 = [T41 XSteam('T_ps', P4, s)];
end

%Plotting T-S dome;
TC = 374;

sDL = XSteam('sL_T', 0);
TDL = linspace(0 ,373,100);

for a = 2:100
    T= TDL(a);
    sDL = [sDL XSteam('sL_T', T)];
end

sDV = XSteam('sL_T', 374);
TDV = linspace(373 ,0,100);

for a = 2:100
    T= TDV(a);
    sDV = [sDV XSteam('sV_T', T)];
end

%Dome Data Points to Include/Exclude
%, sDL, TDL, sDV, TDV
plot(s12, T12, s23, T23, s34, T34, s41, T41, sDL, TDL, sDV, TDV);
xlabel('Entropy (kJ/K.kg)');
ylabel('Temperature (°C)');
legend({'Process 1-2','Process 2-3','Process 3-4','Process 4-1','Saturated Liquid','Saturated Vapor'}, 'Location','northwest')








