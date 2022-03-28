R = 6371;         %km
mu = 3.968 * 10^14;
t_a = R+345;      %km
c_a0 = R+280;      %km
appogee = t_a-25;    %km
t_t = (2 * pi * ((t_a * 1000)^(3/2))) / (mu)^0.5;
Total_time = t_t/6 + 26*t_t;
c_t0 = (2 * pi * ((c_a0 * 1000)^(3/2))) / (mu)^0.5;
c_t2 = (2 * pi * ((appogee * 1000)^(3/2))) / (mu)^0.5;
fprintf('target time period : %d \n Total_time : %d \n Chaser initial time: %d \n chaser final time : %d \n', t_t, Total_time, c_t0, c_t2);

N1=randi([3,11]);
N2=randi([9,17]);
fprintf('N1 initial : %d \n', N1);
fprintf('N2 initial : %d \n', N2);
m_x_dis = [N1; N2];
[c_a1,Hp] = ma_constraint_handle(Total_time, c_a0, c_t0, c_t2, N1, N2);
[delv1, delv2] = ma_objective_fn(appogee*1000, c_a0*1000, c_a1);
delv = delv1+delv2;

m_x_best = [N1; N2; c_a1; Hp; delv1; delv2];

T = 5828.178;
f = 0.9;
i = 1;
while(T>1)
    for loop_index = 1:50
        [m_x_dis_new] = ma_neighbourhood(i, m_x_dis);
        N1_new = m_x_dis_new(1);
        N2_new = m_x_dis_new(2);
        [c_a1, Hp] = ma_constraint_handle(Total_time, c_a0, c_t0, c_t2, N1_new, N2_new);
        [delv1,delv2] = ma_objective_fn(appogee*1000, c_a0*1000, c_a1);
        [m_x_best] = ma_metrapolis_sampling(T, m_x_dis_new, c_a1, Hp, delv1, delv2, m_x_best); 
        m_x_dis(1) = m_x_best(1);
        m_x_dis(2) = m_x_best(2);
    end
    i = i+1;
    T = T*f;
end

for k = 1:6
    disp(m_x_best(k));
end

fprintf('optimal delv: %d \n', m_x_best(5) + m_x_best(6));
        
        


 
