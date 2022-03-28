function m_x_dis_new = ma_neighbourhood(i, m_x_dis)
S0 = 0.5;
S = S0*exp(-i/83);
r1 = -1 + 2*rand;
r2 = -1 + 2*rand;
delN = [r1*S*(11-3); r2*S*(17-9)];
n1 = round(m_x_dis(1) + delN(1));
n2 = round(m_x_dis(2) + delN(2));
if n1 >= 3 && n1 <= 11 && n2 >= 9 && n2 <= 17 
    m_x_dis_new = [n1;n2];
elseif n1>=3 && n1<=11
    m_x_dis_new = [ n1 ;  round(9 + rand*(17-9)) ];
elseif n2 >= 9 && n2 <= 17
    m_x_dis_new = [ round(3 + rand*(11-3)) ; n2 ];
else
    m_x_dis_new = [ round(3 + rand*(11-3)) ; round(9 + rand*(17-9)) ];
end                   
end
