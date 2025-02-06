/*********************************************
 * OPL 22.1.1.0 Model
 * Author: filippostruffi
 * Creation Date: Feb 6, 2025 at 5:38:32 PM
 *********************************************/

dvar float+ x[1..12];
float load_value[1..12] = ...;
float volume_load_value_1[1..12] = ...;
float volume_load_value_2[1..12] = ...;
int weight_limit = ...;
int volume_limit = ...;
float max_supply [1..6] = ...;

maximize sum(i in 1..12) x[i] * load_value[i];

subject to {
    weight_constraint_1: sum(i in 1..6) x[i] <= weight_limit;
    weight_constraint_2: sum(i in 7..12) x[i] <= weight_limit;
    volume_constraint_1:  sum(i in 1..6) x[i] * volume_load_value_1[i] <= volume_limit;
    volume_constraint_2:  sum(i in 7..12) x[i] * volume_load_value_2[i] <= volume_limit;
	equality_constraint: sum(i in 1..6) x[i] == sum(i in 7..12) x[i];    
  	max_supply_constraint: forall(i in 1..6) x[i] + x[i+6] <= max_supply[i];
  
}