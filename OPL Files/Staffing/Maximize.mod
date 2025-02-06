/*********************************************
 * OPL 22.1.1.0 Model
 * Author: filippostruffi
 * Creation Date: Feb 6, 2025 at 5:08:26 PM
 *********************************************/

dvar float+ x[1..6];
float cost[1..6] = ...;
float time_slots[1..8][1..6] = ... ;
float min_requirements[1..8] = ... ;

minimize sum(i in 1..6) x[i] * cost[i];

subject to {
  
    forall(t in 1..8) sum(i in 1..6) time_slots[t][i] * x[i] >= min_requirements[t];
    max_full_time: x[1] <= 12;
    max_part_time: sum(i in 2..6) 4 * x[i] <= 56;
}