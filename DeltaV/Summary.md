# Summary
----

## Purpose
----- 
**This task was performed to deal with the following:**
- Figure out our deltaV requirements by getting a ballpark deltaV number.
- Compare this value to the deltaV that the thrusters can provide. This would help to select appropriate thruster which inturn would give us the total fuel, mass and power requirements from thrusters.
- Understand how deltaV changes with change in altitude - Help us get an idea of our chaser and target orbits.
- Is summation of small deltaVs when applied in steps equal to deltaV when going directly from one orbit to other.
- Better understanding of maneuvers.

## Problem Description
----
**The following example was considered to perform phasing:**

![alt text](https://github.com/anjalirawat06/PHASING/blob/master/DeltaV/phasing%201.png?raw=true)
----

- Target and chaser orbits are coplanar. (Difference in other orbital parameters is not considered)
- Target altitude = 345 km. Initially at position C.
- Chaser semi-major axis = R + 280 km. Initially at position A.
- Appogiee is fixed (point B in image) = Target orbit - 25 km = 320 km (in this case). This is the point where target and chaser will attain their relative ending position. (See relative position of D and B)
- Phase angle = 120 deg

This same problem is solved for higher orbits. 
Target orbit altitude and chaser semi-major axis are increased by 100 km each. 7 such cases are studied.   

## Phasing Stratergies
----

Two phasing stratergies are employed -

**Phasing 1:**
Path of chaser: 
1. Orbit 1 (A to B) 
2. Impulse at B in opposite direction of motion. Decreases velocity at appogiee to lower the perigiee directly to Orbit 2. Perigiee not lowered below 160 km altitude because that is limit to LEO. Appogiee unchanged.
3. Goes to Orbit 2  (B to B performing the number of revolutions required to cover the phase angle). This number of revolutions is figured using hit and trial. 
4. Target and chaser coasts in their orbits, performing the number of revolutions mentioned. 
5. Phase angle becomes zero and relative position attained (D and B).
6. Impulse at B in same direction as motion. Increases velocity at appogiee to raise the perigiee directly to Orbit 3 and make it circular with R = appogiee.
- **Involes 2 big impulses.**

----

**Phasing  2:**
Path of chaser:
1. Orbit 1 (A to B)
2. Impulse at B in opposite direction of motion. Decreases velocity at appogiee to lower the perigiee (Not directly to Orbit 2).
3. Chaser enters an intermediate orbit 1.1 (between Orbit 1 and 2) whose semi-major axis, a = a_initial(Orbit 1) - 2 km. Completes one revolution from B to B.
4. Again lowers perigiee to an intermediate orbit whose semi-major axis, a = a_initial(intermediate orbit 1.1) - 2 km. Completes one revolution from B to B.
5. This lowering of perigiee continues till the relative position is met (D and B).
- **Involes several small impulses.**


## Results
----
1. DeltaV depends on Delta a (i.e difference in the orbit altitudes). For the same initial relative arrangement of target and chaser a particular phasing stratergy requires almost the same amount of deltaV be it at any altitude.


2. In phasing 1 : 
- DeltaV 1 = 23m/s - 25m/s (all cases)
- DeltaV 2 = 45m/s - 46m/s (all cases)
- Total DeltaV = 70m/s - 71m/s (all cases)
- Time required = 21hrs - 24hrs

3. It was found that for every 2 km reduction in a, deltaV required to lower perigiee (by giving impulse at appogiee) was ~ 1m/s.


4. In phasing 2 :
- DeltaV in each small impulse = 1m/s - 1.2m/s
- Total DeltaV = 14m/s - 16m/s
- Reason for reduction in total deltaV as compared to phasing 1 : Orbit 2 of phasing 1 is not same as orbit 2 of phasing 2. Since time is spent in coasting in intermediate orbits so relative position is attained at a perigiee not so low as in phasing 1. Delta a (Orbit 1 - Orbit 2) is less in phasing 2 therefore DeltaV is also less.
- Time required  = 21hrs - 24 hrs

5. Disadvantage of phasing 2 :
- It does not take account of going from orbit2 to orbit3.
- If orbit2 to orbit3 transition has to be done in steps, it will require some modification in the time balancing equations to achive the same relative end position of target and chaser.

6. If delta a of phasing 1 and 2 both were same, summation of deltaVs (in steps) will be equal to deltaV (directly).
7. We can put our chaser and target orbits anywhere keeping in mind launch vehicle limits. DeltaV will only change with delta a and the phasing stratergy we employ.
8. Thrusters have the capability to give a good enough deltaV ~ 1km/s. 
9. Response time of thrusters is an issue which will be delt with later.

