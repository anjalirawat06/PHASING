# Summary
----

## Simulated Annealing
----- 

SA is an optimization algorithm derived from “annealing” in chemistry. In chemistry, the metal/alloy is heated to high temperature, held at that temp, and then cooled in a controlled fashion, so that the resulting state is a minimum energy configuration. Simulation of this process is simulated annealing. It is an optimization algorithm that is used to solve other optimization problems as well.

In annealing the parameters are: 

Design Variables – material parameters <br />
Cost function – energy <br />
Constraint – Temperature

The process begins as a random walk and as temperature decreases it convert to hill climbing technique.

**Hill climbing-**
- Exploiting that is trying to get the local search by discovering local spaces of the solutions i.e exploiying the promising areas found (mostly after exploration)
- Choose the best among the neighbours
- DeltaE positive – accept it with probability 1
  Delta E negative – reject it with probability 1
  or accept it with probability 0
  
**Random walk-**
- Exploration i.e. trying to get the global search by discovering large spaces of the solutions
- Making a move to random neighbour irrespective of a good or a bad move
- Doesn’t care about DeltaE positive or negative
  Always accept it with probability 0.5

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


## Phasing Stratergy
----

Path of chaser: 
1. Orbit 1 (A to B) 
2. Impulse at B in opposite direction of motion. Decreases velocity at appogiee to lower the perigiee directly to Orbit 2. Perigiee not lowered below 160 km altitude because that is limit to LEO. Appogiee unchanged.
3. Goes to Orbit 2  (B to B performing the number of revolutions required to cover the phase angle). This number of revolutions is figured using hit and trial. 
4. Target and chaser coasts in their orbits, performing the number of revolutions mentioned. 
5. Phase angle becomes zero and relative position attained (D and B).
6. Impulse at B in same direction as motion. Increases velocity at appogiee to raise the perigiee directly to Orbit 3 and make it circular with R = appogiee.
- **Involes 2 big impulses.**

## Design Variables
----

The design variable specific to our problem are: 

x = {N1, N2, ΔHp}  <br />
where, <br />
N1: number of revolutions satellite takes after first impulse <br />
N2: number of revolutions satellite takes after second impulse in circular orbit to attain final conditions <br />
ΔHp: the altitude by which perigiee should be shifted to perform phasing


## Constraints
----

The contraint in our problem is:

f(x) = u<sub>tar</sub>(tf)− u<sub>cha</sub>(tf ) = 0 <br />
i.e the phase angle between the target and the chaser should be equal to zero at the end of phasing i.e. at time tf

## Objective function
----

The total characteristic velocity increment is chosen as the optimization performance index. <br />
J = ΔV1 + ΔV2

## Results
----
The optimal design variables obtained after simulation are: <br />
N1 = 11 <br />
N2 = 15 <br />
ΔHp = -63.598 km (i.e perigiee is lowered for phasing)

The optimal objective function corresponding to these design variables is:
ΔV1 = 18.6879 <br />
ΔV2 = 41.8799 <br />
Total optimal ΔV: 60.56775 m/s

