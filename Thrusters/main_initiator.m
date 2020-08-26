%Thruster C
disp('THRUSTER C');
m = 160;         % g
m_other = 3000;  % g
Isp = 8500;      % s
I = 3400;        % Ns
[deltaV, mass_ejected] = ma_thruster(m,m_other,Isp,I);
fprintf('delta V: %4.7f m/s \n', deltaV);
fprintf('mass ejected: %4.7f g \n \n', mass_ejected*1000);

%Thruster D
disp('THRUSTER D');
m = 280;        % g
m_other = 3000; % g
Isp = 8500;     % s
I = 3400;       % Ns
[deltaV, mass_ejected] = ma_thruster(m,m_other,Isp,I);
fprintf('delta V: %4.7f m/s \n', deltaV);
fprintf('mass ejected: %4.7f g \n', mass_ejected*1000);
