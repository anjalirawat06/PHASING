function [c_a1,Hp] = ma_constraint_handle(Total_time, c_a0, c_t0, c_t2, N1, N2)
mu = 3.968 * (10^14);
c_t1 = ( Total_time - c_t0/2 - N2*c_t2 )/N1;
c_a1 = ( (c_t1^2 * mu) / (4* 3.14^2) )^(1/3);
Hp = 2*(c_a1 - c_a0*1000);
end
