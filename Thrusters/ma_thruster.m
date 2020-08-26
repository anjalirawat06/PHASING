function [deltaV, mass_ejected] = thruster(mass_thruster, mass_other, Isp, Impulse)
    g = 9.8;   % m/s^2
    M = mass_thruster*6;     % six thrusters for sic DOF  
    Ve = g*Isp;              % exhaust velocity
    mass_ejected = Impulse/Ve;  
    imass = mass_other + M;     
    fmass = imass - mass_ejected;  
    deltaV = g*Isp*log(imass/fmass);   % m/s
end