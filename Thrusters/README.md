# Thrusters

## Function_1 main_initiator
-----

**Code Author:** Anjali Rawat

**Created on:** 27/08/2020

**Last modified:** 27/08/2020

**Reviwed by:** -

**Description:**
----
It contains the parameters of the two shortlisted thrusters (C and D). Parameters - mass, satellite mass without thrusters, Specific impulse and Total impulse. It calls ma_thruster function to calculate the amount of deltaV the specific thruster can provide at one time along with the amount of mass that it ejects to do so. 

**Formulae used:** 
----
None

**Variable Description:**
----
m:(float)- mass of one thruster (g)

m_other:(float)- mass of other components of satellite (g)

Isp:(float)- specific impulse of thruster (s)

I:(float)- total imppulse of thruster (Ns)

deltaV:(float)- deltaV that thruster will provide (m/s) 

mass_ejected:(float)- mass ejected by thruster (kg)


**Output:**
----
Prints the amount of deltaV the specific thruster can provide at one time along with the amount of mass that it ejects to do so.


## Function_2 ma_thruster
-----

**Code Author:** Anjali Rawat

**Created on:** 27/08/2020

**Last modified:** 27/08/2020

**Reviwed by:** -

**Description:**
----
Recievs arguments (mass of thruster, mass of other components, specific impulse, Impulse). Calculates the amount of deltaV the specific thruster can provide at one time along with the amount of mass that it ejects to do so.

**Formulae used:** 
----
1. Exhaust velocity = g * Specific impulse

2. mass_ejected = Impulse/Exhaust velocity

3. final mass = initial mass - mass ejected

4. deltaV = g * Isp * log(initial mass/final mass)  (rocket equation)

**Variable Description:**
----
mass_thruster:(float)- mass of one thruster (g)

mass_other:(float)- mass of other components (g)

Isp:(float)- specific impulse of thruster (s)

Impulse:(float)- Impulse of thrsuter (Ns)

g:- constant gravity of earth (m/s^2)

M:(float)- total mass of 6 thrusters (g)

Ve:(float)- Exhaust velocity (m/s)

mass_ejected:(float)- mass ejected by thruster (kg)

imass:(float)- initial mass of total satellite (g)

fmass:(float)- final mass of total sateliite after the impulse has been applied (g)

deltaV:(float)- deltaV that thruster will provide (m/s) 


**Output:**
----
Returns the amount of deltaV the specific thruster can provide at one time along with the amount of mass that it ejects to do so.

# Test cases:
----

## Thruster C

**Isp: 2600s - 8500s,**
**I: <13000Ns,**
**Thrust: <140uN**

  |**Input**                    |**Output**       |
  |-----------------------------|-----------------|
  |mass                         |delta V          |
  |mass of other components     |mass ejected     |
  |Isp                          |                 |
  |Impulse                      |                 |
  
  
**Test case 1:**
----
  |**Input**       |**Output**       |
  |----------------|-----------------|
  |160 g           |253.7849364 m/s  |
  |3000 g          |39.2464678 g     |
  |2600 s          |                 |
  |1000 Ns         |                 |
 
**Test case 2:**
----
  |**Input**       |**Output**       |
  |----------------|-----------------|
  |160 g           |252.9087950 m/s  |
  |3000 g          |12.0048019 g     |
  |8500 s          |                 |
  |1000 Ns         |                 |
  
**Test case 3:**
----
  |**Input**       |**Output**       |
  |----------------|-----------------|
  |160 g           |3514.4296478 m/s |
  |3000 g          |510.2040816 g    |
  |8500 s          |                 |
  |13000 Ns        |                 |
  
## Thruster D

**Isp: 3000s - 8500s,**
**I: <3400 Ns,**
**Thrust: <40 uN**

  |**Input**                    |**Output**       |
  |-----------------------------|-----------------|
  |mass                         |delta V          |
  |mass of other components     |mass ejected     |
  |Isp                          |                 |
  |Impulse                      |                 |
  
  
**Test case 1:**
----
  |**Input**       |**Output**       |
  |----------------|-----------------|
  |280 g           |214.4554778 m/s  |
  |3000 g          |34.0136054 g     |
  |3000 s          |                 |
  |1000 Ns         |                 |
  
**Test case 2:**
----
  |**Input**       |**Output**       |
  |----------------|-----------------|
  |280 g           |213.9497354 m/s  |
  |3000 g          |12.0048019 g     |
  |8500 s          |                 |
  |1000 Ns         |                 |
  
**Test case 3:**
----
  |**Input**       |**Output**       |
  |----------------|-----------------|
  |280 g           |729.6823112 m/s  |
  |3000 g          |40.8163265 g     |
  |8500 s          |                 |
  |3400 Ns         |                 |
  
----
  
  
