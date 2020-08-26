function ma_phasing1(ta,ca,N,n)
    R = 6371;     % km
    t_t = (2 * 3.14 * ((ta * 1000)^(3/2))) / (3.968 * (10^14))^0.5;    % time period of target (s)
    c_t = (2*3.14*((ca*1000)^(3/2))) / (3.968*(10^14))^0.5;            % time period of chaser (s)
     
    T = t_t/6 + N*t_t;                                                 % total time chaser has to cover phase angle (s)
    t_cnew = T - c_t/2;                                                % total time apent in new orbit (s)

    t = t_cnew/n;                                                      % time period of new orbit (s)
    a = ((t^2)  *  (3.968*(10^14)) / (4* (3.14^2)) ) ^ (1/3);          % a of new orbit (m)
    
    appogiee = ta-25;                                                  % km
    fprintf('orbit 2 \n delta a= %4.5f km \n a= %4.5f km \n appogiee= %4.5f km \n perigiee= %4.5f km \n', ca-a/1000, (a/1000 - R), appogiee-R, ((2*a-appogiee*1000)/1000  - R) );
    mu = 3.986004418 * (10^14);                                        % m^3/s^2
    delv1 = abs( (2*mu/(appogiee*1000) - mu/(ca*1000))^0.5 -  (2*mu/(appogiee*1000) - mu/a)^0.5 );  % m/s                                       
    delv2 = abs( (mu/(appogiee*1000))^0.5  -   (2*mu/(appogiee*1000) - mu/a)^0.5  );                % m/s    
    fprintf('delta v 1 to 2: %4.5f m/s \n delta v 2 to 3: %4.5f m/s \n', delv1, delv2);
    fprintf('total delta v: %4.5f m/s \n', delv1+delv2);
    fprintf('total time: %4.5f hrs \n \n', T/3600);
        % perigiee ht min 160km
end