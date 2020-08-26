function ma_phasing2(ta,ca,N)        
    R = 6371;                        % km
    mu = 3.986004418 * (10^14);      % m^3/s^2
    
    t_t = (2 * 3.14 * ((ta*1000)^(3/2))) / mu^0.5;    % time period of target (s)
    c_t = (2 * 3.14 * ((ca*1000)^(3/2))) / mu^0.5;    % time period of chaser (s)
    
    T = t_t/6 + N*t_t;      % total time in which chaser has to cover phase angle (s)
    disp(T/3600); 
    appogiee = ta - 25;     % appogiee is fixed (km)
    
    ia = ca;                % reference orbit
    time = c_t/2;           % initially set to half time perios of chaser (s)
    n = 0;                  % counting steps
    a = 0;                  % new orbit = reference orbit-2 (km)
    delv = [];
    total_V = 0;           % m/s
    while (time < T) 
        a = ia-2;          % lowering the a by 2km
        time = time + (2 * 3.14 * ((a*1000)^(3/2))) / (3.968 * (10^14))^0.5;  %s
        n = n + 1;         % incrementing steps
        v = abs( (2 * mu/(appogiee*1000) - mu/(ia*1000))^0.5 -  (2*mu/(appogiee*1000) - mu/(a*1000))^0.5 ); %m//s
        fprintf('%4.0f   %4.5f hrs   %4.5f m/s \n', n, time/3600, v);
        delv(n) = v;
        total_V = total_V + v;      % m/s
        ia = a;           % setting new orbit as reference orbit
    end
        
    fprintf('delta a: %4.2f km \n number of steps taken: %4.2f \n final a: %4.2f km \n appogiee= %4.2f km \n perigiee= %4.2f km', 2, n, a, appogiee-R, ((2*a-appogiee) - R) );
    fprintf('\n total delv from 1 to 2: %4.5f m/s \n \n', total_V);
        % perigiee ht min 160km
end