/*********************************************
 * OPL 22.1.1.0 Model
 * Author: filippostruffi
 * Creation Date: Feb 6, 2025 at 3:57:36 PM
 *********************************************/

dvar float+ x[1..6];
float risks[1..6] = [1.7, 1.2, 3.7, 2.4, 2, 2.9];
float interest[1..6] = [0.07, 0.1, 0.19, 0.12, 0.08, 0.14];
int tot_funds = 5000000;

maximize sum(i in 1..6) x[i] * interest[i];

subject to {
    total_funds_constraint: sum(i in 1..6) x[i] <= tot_funds;
    max_features_constraint: forall(i in 1..6) x[i] <= 0.25 * sum(j in 1..6) x[j];    
    total_risk_constraint: sum(i in 1..6) x[i] * risks[i] <= 2 * sum(i in 1..6) x[i];
    precious_metals: x[3] + x[4] >= 0.3 * sum(i in 1..6) x[i];
    trade_credits_bonds: x[1] + x[2] >= 0.45 * sum(i in 1..6) x[i];
}