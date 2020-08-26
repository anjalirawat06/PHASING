R=6371;            %km
t_a=[R+345; R+445; R+545; R+645; R+745; R+845; R+945];  %km
t_e=0;
c_a=[R+280; R+380; R+480; R+580; R+680; R+780; R+880];  % km
c_e=zeros(7);                                           % eccentricity

for loop_index = 1:7 %calculating eccentricities
    c_e(loop_index) = (t_a(loop_index) - 25) / c_a(loop_index) - 1 ;
end

fprintf('Target orbit radius \t chaser initial a \t chaser initial eccentricity \t chaser appogiee \t chaser perigiee \n');
for loop_index = 1:7
    i=loop_index;
    fprintf('%4.0f km \t\t\t\t %4.0f km \t\t\t %d \t\t\t\t\t %4.0f km \t\t\t %4.0f km \t\t\t\n', t_a(i)-R, c_a(i)-R, c_e(i), (t_a(i) - 25)-R, (2*c_a(i)-(t_a(i) - 25)  - R));
end

disp('PHASING STRATERGY 1');
for loop_index = 1:7
    i = loop_index;
    ma_phasing1(t_a(i),c_a(i),14,14);
end

disp('PHASING STRATERGY 2: In Steps');
for loop_index = 1:7
    i = loop_index;
    ma_phasing2(t_a(i),c_a(i),14);
end


