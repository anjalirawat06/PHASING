function [delv1, delv2] = ma_objective_fn(appogee, c_a0, c_a1)
mu=3.968 * (10^14);
delv1 = abs( (2*mu/(appogee) - mu/(c_a0))^0.5 -  (2*mu/(appogee) - mu/c_a1)^0.5 );  % m/s
delv2 = abs( (2*mu/(appogee) - mu/(c_a1))^0.5 -  (2*mu/(appogee) - mu/appogee)^0.5 );  % m/s
end
