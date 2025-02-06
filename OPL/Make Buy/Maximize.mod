/*********************************************
 * OPL 22.1.1.0 Model
 * Author: filippostruffi
 * Creation Date: Feb 6, 2025 at 2:50:44 PM
 *********************************************/

float silk_usage[1..8] = ...;
float poly_usage[1..8] = ...;
float cott_usage[1..8] = ...;
float max_silk = ...;
float max_poly = ...;
float max_cott = ...;
int demand[1..4] = ...;
float profit[1..8] = ...;

dvar float+ x[1..8];

maximize sum(i in 1..8) x[i] * profit[i];


subject to 
{
  
  silk_constraint: sum(i in 1..8) x[i] * silk_usage[i] <= max_silk;
  poly_constraint: sum(i in 1..8) x[i] * poly_usage[i] <= max_poly;
  cott_constraint: sum(i in 1..8) x[i] * cott_usage[i] <= max_cott;

  max_supply_constraint_silk: x[1] + x[5] == demand[1];
  max_supply_constraint_poly: x[2] + x[6] == demand[2];
  max_supply_constraint_blend1: x[3] + x[7] == demand[3];
  max_supply_constraint_blend2: x[4] + x[8] == demand[4];
}