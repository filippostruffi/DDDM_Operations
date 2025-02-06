/*********************************************
 * OPL 22.1.1.0 Model
 * Author: filippostruffi
 * Creation Date: Feb 6, 2025 at 5:19:57 PM
 *********************************************/
 
dvar float+ x[1..6];
float load_value[1..6] = ...;
float volume_load_value[1..6] = ...;
int weight_limit = ...;
int volume_limit = ...;
float max_supply [1..6] = ...;

maximize sum(i in 1..6) x[i] * load_value[i];

subject to {
    weight_constraint: sum(i in 1..6) x[i] <= weight_limit;
    volume_constraint:  sum(i in 1..6) x[i] * volume_load_value[i] <= volume_limit;
    max_supply_constraint: forall(i in 1..6) x[i] <= max_supply[i];
}
