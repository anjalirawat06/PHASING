# Delta V

## Function_1 main_ballpark_deltaV
-----

**Code Author:** Anjali Rawat

**Created on:** 27/08/2020

**Last modified:** 27/08/2020

**Reviwed by:** -

**Description:**
----
It contains array of radii of circular target orbits (altitude ranging from 345km to 945km) and array of semi-major axis of elliptical chaser orbit (ranging from R+280km to R+880km, where R=raduis of earth). Target orbit as well as semi-major axis of chaser are both raised by 100km in the respective arrays. Target and chaser orbits are coplanar. Appogiee is fixed at 25km below target orbit, so using that different eccentricities of chaser orbits are calculated. For each target and chaser orbit, it calls phasing1 and phasing2 stratergy functions respectively to initiate calculation of total deltaV required.

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
Phasing stratergy 1: Chaser moves from its initial orbit directly to a lower orbit by lowering its perigiee (giving impulse at appogiee), with appogiee remaining same, in order to cover the phase angle of 120 deg. Once phase angle =0 (i.e chaser is 25km below target at appogiee) after some number of revolutions, the chaser moves to a circular orbit of radius=fixed_appogiee (by giving impulse again at appogiee). This stratergy requires deltaV two times only.
This function takes in arguments - (target orbit radius, chaser semi-major axis, number of revolutions taregt should make, number of revolutions chaser should make in its new orbit). These number of revolutions are provided by hit and trial method by the main_ballpark_deltaV. 

**Formulae used:**
----
