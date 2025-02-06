/*********************************************
 * OPL 22.1.1.0 Model
 * Author: filippostruffi
 * Creation Date: Feb 6, 2025 at 3:41:33 PM
 *********************************************/


float tot_household = ...;
float min_30_household = ...;
float f31_t50_household = ...;
float interview_cost[1..6] = ...;

dvar float+ x[1..6];

minimize sum(i in 1..6) x[i] * interview_cost[i];


subject to 
{
  
  total_constraint: sum(i in 1..6) x[i]  >= tot_household;
  under_30_constraint: x[1] + x[4]  >= min_30_household;
  from_31_to_50_constraint: x[2] + x[5]  >= f31_t50_household;
  border_mex_constraint: sum(i in 1..3) x[i] >= sum(i in 1..3) x[i] * 0.15;
  no_border_under_30_constraint: x[4] >= (x[1]+x[4]) * 0.5;
  border_over_50_constraint: x[3] <= (x[3]+x[6]) * 0.2;

  
}