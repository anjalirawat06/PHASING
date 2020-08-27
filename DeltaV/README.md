# Delta V

## Function_1 main_ballpark_deltaV
-----

**Code Author:** Anjali Rawat

**Created on:** 27/08/2020

**Last modified:** 27/08/2020

**Reviwed by:** -

**Description:**
----
It contains array of radii of circular target orbits (altitude ranging from 345km to 945km) and array of semi-major axis of elliptical chaser orbit (ranging from R+280km to R+880km, where R=raduis of earth). Target orbit as well as semi-major axis of chaser are both raised by 100km in the respective arrays. Target and chaser orbits are coplanar. Appogiee is fixed at 25km below target orbit, so using that different eccentricities of chaser orbits are calculated. For each target and chaser orbit, it calls phasing1 and phasing2 stratergy functions respectively to initiate calculation of total deltaV required. While calling it send a parameter-number of revolutions which is decided by hit and trial.

**Formulae used:** 
----

1. eccentricity= appogiee/semi-major axis - 1


**Variable Description:**
----
R:- constant radius of the earth (km)

t_a:(float)- array storing radii of circular target orbits (km)

t_e:- constant eccentricity of circular target orbit

c_a:(float)- array storing semi-major axis of elliptical chaser orbits (km)

c_e:(float)- array storing eccentricities of elliptical chaser orbits 

loop_index:(int)- for loop iteration variable

i:(int)- dummy variable having same value as that of iteration variable


**Output:**
----
Prints the initial values of target obit radius, initial semi-major axis of chaser, its eccentricity, appogiee, perigiee.

----
## Function_2  ma_phasing1
----
**Code Author:** Anjali Rawat

**Created on:** 27/08/2020

**Last modified:** 27/08/2020

**Reviwed by:** -

**Description:**
----
Phasing stratergy 1: Chaser moves from its initial orbit (orbit 1) directly to a lower orbit (orbit 2) by lowering its perigiee (giving impulse at appogiee), with appogiee remaining same, in order to cover the phase angle of 120 deg. Once phase angle =0 (i.e chaser is 25km below target at appogiee) after some number of revolutions, the chaser moves to a circular orbit (orbit 3) of radius=fixed_appogiee (by giving impulse again at appogiee). This stratergy requires deltaV two times only.
This function takes in arguments - (target orbit radius, chaser semi-major axis, number of revolutions taregt should make, number of revolutions chaser should make in its new orbit). These number of revolutions are provided by hit and trial method by the main_ballpark_deltaV. 

**Formulae used:**
----
1. time period = (2 * 3.14 * (semi-major axis^1.5)/mu )^0.5

2. semi-major axis = ((time period^2)  *  mu) / (4* (3.14^2)) ) ^ (1/3)

3. Velocity at appogiee in orbit 1 = (2*mu/appogiee - mu/a_1 )^0.5

4. Velocity at appogiee in orbit 2 = (2*mu/appogiee - mu/a_2 )^0.5

3. deltaV = | v1 - v2 |


**Variable description:**
----

ta:(float)- radius of target orbit (km)

ca:(float)- radius of chaser orbit (km)

N:(int)- number of revolutions made by target in its orbit

n:(int)- number of revolutions made by chaser in its new orbit

R:- constant radius of the earth (km)

t_t:(float)- time preriod of chaser (s)

c_t:(float)- time period of chaser initial orbit (s)

T:(float)- total time in which chaser has to cover phase angle (i.e time taken by target to cover angle of 60 deg and align with appogie of chaser orbit (t_t/6) + total time spent in coasting by the target(N*t_t) )  (s)

t_cnew:(float)- time chaser will spend in its new orbit 2 (i.e T - time taken by chaser to coast from perigiee to appogiee in its initial orbit (c_t/2) ) (s)

appogiee:(float)- stores the fixed value of appogiee (i.e radius of target orbit -25km) (km)

mu- GMe (gravitational constant*mass of the earth) (m^3/s^2)

delv1:(float)- to store the deltaV required to go from orbit 1 to orbit  2 (m/s)

delv2:(float)- to store the deltaV required to go from orbit 2 to orbit 3 (m/s)


**Output:**
----

prints orbital elememts of chaser orbit 2 (delta a, a, appogiee, perigiee)(km), deltaV 1 and deltaV 2, total deltaV (m/s) and total time taken (hrs).


----
## Function 3 ma_phasing2
----

**Code Author:** Anjali Rawat

**Created on:** 27/08/2020

**Last modified:** 27/08/2020

**Reviwed by:** -

**Description:**
----
Phasing stratergy 2: Since Stratergy 1 takes large values of delta V at one impulse, this stratergy aims at breaking the deltaV into smaller deltaV. This is achieved by lowering the perigiee of orbit 2 in steps rather than at once. Semi major axis of the itermediate orbit is reduced by 2km in each step. This lowering of perigiee in steps continues till the time spent by chaser is less than total time provided by the target to the chaser to cover phase angle of 120 deg. Once time exceeds means we have achieved our end relative position of target and orbit.
Advantages - 
1. DeltaV is broken down to smaller deltaV
2. Total deltaV is also reduced, since the difference in semi-major axis of final orbit2 and initial orbit1 is less than that of phasing stratergy 1.
Disadvantage - 
1. It does not take account of going from orbit2 to orbit3.
2. If orbit2 to orbit3 transition has to be done in steps, it will require some modification in the time balancing equations to achive the same relative end position of target and chaser.

It takes in arguments (target orbit, chaser initial orbit, number revolutions made by the target (provided by ma_ballpark_deltaV by hit and trial)).  

**Formulae used:**
----
1. time period = (2 * 3.14 * (semi-major axis^1.5)/mu )^0.5

2. Velocity at appogiee = (2*mu/appogiee - mu/a )^0.5

3. deltaV = | v1 - v2 |

**Variable description:**
----

ta:(float)- radius of target orbit (km)

ca:(float)- radius of chaser orbit (km)

N:(int)- number of revolutions made by target in its orbit

R:- constant radius of the earth (km)

mu- GMe (gravitational constant*mass of the earth) (m^3/s^2)

t_t:(float)- time preriod of chaser (s)

c_t:(float)- time period of chaser initial orbit (s)

T:(float)- total time in which chaser has to cover phase angle (i.e time taken by target to cover angle of 60 deg and align with appogie of chaser orbit (t_t/6) + total time spent in coasting by the target(N*t_t) )  (s)

appogiee:(float)- stores the fixed value of appogiee (i.e radius of target orbit -25km) (km)

ia(float):- reference orbit in which chaser presently is. (keeps on updating with every loop) (km)

a(float):- intermediate orbit to which chaser has to go (reference orbit - 2km) (keeps on updating with every loop) (km)

time:(float)- the time spent by chaser in its intermediate orbits (keeps on incrementing as steps increase) (s)

n:(int)- steps

v:(float)- deltaV at each manoever (m/s)

delv:(float)- array which stores deltav required in each step (m/s)

total_V(float)- stores sum of the smaller deltaV (i.e it stores total deltaV required in this stratergy) (m/s)


**Output:**
----
Prints total time of the process (hrs), time spent and deltaV required in each step, number of steps taken, orbital elemets of final orbit2 (difference in semi-major axis of final orbit 2 and orbit 1, final semi-major axis, appogiee, perigiee) and the total deltaV.

----
# Test cases:
----

## Phasing 1

 N(number of revolutions made by target) 
 n(number of revolutions made by chaser in orbit2) 
 
  |**Input**                    |**Output**       |
  |-----------------------------|-----------------|
  |Target orbit radius          |delta a          |
  |Chaser-a                     |final a          |
  |Chaser-appogiee              |appogiee         |
  |N                            |perigiee         |
  |n                            |deltaV 1-2       |
  |                             |deltaV 2-3       |
  |                             |total deltaV     |
  |                             |total time taken |
  
**Test case 1:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 345 km    |39.69647 km               |
  |R + 280 km    |240.30353 km              |
  |R + 320 km    |320.00000 km              |
  |14            |160.60706 km              |
  |14            |23.41712 m/s              |
  |              |46.66165 m/s              |
  |              |70.07877 m/s              |
  |              |21.59260 hrs              |
  
**Test case 2:**
----

  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 445 km    |41.29005 km               |
  |R + 380 km    |338.70995 km              |
  |R + 420 km    |420.00000 km              |
  |14            |257.41990 km              |
  |14            |23.82031 m/s              |
  |              |46.55079 m/s              |
  |              |70.37111 m/s              |
  |              |22.07666 hrs              |
  

**Test case 3:**
----

  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 545 km    |42.88364 km               |
  |R + 480 km    |437.11636 km              |
  |R + 520 km    |520.00000 km              |
  |14            |354.23273 km              |
  |14            |24.20225 m/s              |
  |              |46.43735 m/s              |
  |              |70.63961 m/s              |
  |              |22.56428 hrs              |
  
  
**Test case 4:**
----

  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 645 km    |44.47722 km               |
  |R + 580 km    |535.52278 km              |
  |R + 620 km    |620.00000 km              |
  |14            |451.04556 km              |
  |14            |24.56415 m/s              |
  |              |46.32160 m/s              |
  |              |70.88575 m/s              |
  |              |23.05544 hrs              |
  
  
**Test case 5:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 745 km    |46.07081 km               |
  |R + 680 km    |633.92919 km              |
  |R + 720 km    |720.00000 km              |
  |14            |547.85838 km              |
  |14            |24.90712 m/s              |
  |              |46.20378 m/s              |
  |              |71.11090 m/s              |
  |              |23.55011 hrs              |
  
**Test case 6:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 845 km    |47.66440 km               |
  |R + 780 km    |732.33560 km              |
  |R + 820 km    |820.00000 km              |
  |14            |644.67120 km              |
  |14            |25.23221 m/s              |
  |              |46.08413 m/s              |
  |              |71.31634 m/s              |
  |              |24.04827 hrs              |
  
**Test case 7:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |R + 945 km    |49.25800 km               |
  |R + 880 km    |830.74200 km              |
  |R + 920 km    |920.00000 km              |
  |14            |741.48401 km              |
  |14            |25.54040 m/s              |
  |              |45.96284 m/s              |
  |              |71.50324 m/s              |
  |              |24.54989 hrs              |
  

## Phasing 2

  |**Step**          |**Time spent**   |**deltaV**       |
  |------------------|-----------------|-----------------|
  |step number       |time spent       |deltaV           |

  |**Input**                    |**Output**            |
  |-----------------------------|----------------------|
  |Target orbit radius          |delta a               |
  |Chaser-a                     |final a               |
  |Chaser-appogiee              |appogiee              |
  |N                            |perigiee              |
  |                             |total deltaV 1-2      |
  |                             |total time taken      |
  |                             |number of steps taken |
   
**Test case 1:**
----
  |**Step** |**Time spent**   |**deltaV**   |
  |---------|-----------------|-------------|
  |1        |2.25079 hrs      |1.17142 m/s  | 
  |2        |3.75154 hrs      |1.17231 m/s  | 
  |3        |5.25162 hrs      |1.17319 m/s  | 
  |4        |6.75102 hrs      |1.17408 m/s  | 
  |5        |8.24975 hrs      |1.17496 m/s  |
  |6        |9.74779 hrs      |1.17585 m/s  | 
  |7        |11.24516 hrs     |1.17674 m/s  |
  |8        |12.74186 hrs     |1.17763 m/s  |
  |9        |14.23787 hrs     |1.17852 m/s  | 
  |10       |15.73321 hrs     |1.17941 m/s  |
  |11       |17.22787 hrs     |1.18031 m/s  | 
  |12       |18.72186 hrs     |1.18120 m/s  |
  |13       |20.21517 hrs     |1.18209 m/s  |
  |14       |21.70781 hrs     |1.18299 m/s  |
  

  |**Input**         |**Output**            |
  |------------------|----------------------|
  |R + 345 km        |2.00 km               |
  |R + 280 km        |6623.00 km            |
  |R + 320 km        |320.00 km             |
  |14                |184.00 km             |
  |                  |16.48071 m/s          |
  |                  |21.5438 hrs           |
  |                  |14                    |
  

#### (Values of intermediate test cases fall between these two testcases) 

**Test case 7:**
----
  |**Step** |**Time spent**   |**deltaV**   |
  |---------|-----------------|-------------|
  |1        |2.56219 hrs      |1.02853 m/s  | 
  |2        |4.27067 hrs      |1.02924 m/s  | 
  |3        |5.97844 hrs      |1.02996 m/s  |
  |4        |7.68550 hrs      |1.03067 m/s  |
  |5        |9.39185 hrs      |1.03138 m/s  | 
  |6        |11.09750 hrs     |1.03210 m/s  |
  |7        |12.80244 hrs     |1.03281 m/s  |
  |8        |14.50667 hrs     |1.03353 m/s  | 
  |9        |16.21020 hrs     |1.03424 m/s  |
  |10       |17.91302 hrs     |1.03496 m/s  |
  |11       |19.61514 hrs     |1.03568 m/s  | 
  |12       |21.31654 hrs     |1.03640 m/s  |
  |13       |23.01724 hrs     |1.03712 m/s  |
  |14       |24.71724 hrs     |1.03784 m/s  | 
  
  |**Input**         |**Output**            |
  |------------------|----------------------|
  |R + 945 km        |2.00 km               |
  |R + 880 km        |7223.00 km            |
  |R + 920 km        |920.00 km             |
  |14                |784.00 km             |
  |                  |14.46446 m/s          |
  |                  |24.4944 hrs           |
  |                  |14                    |
  
----
