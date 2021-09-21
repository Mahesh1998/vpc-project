# LOAD BALANCER MODULE
1. Created AWS LOAD BALANCER resource with required parameters.
2. All the parameters are declared as variables and stored in the variables.tf file.
3. Parameter values will be passed to resource while calling the LOAD BALANCER module.
4. To make use of the parameter in different module, the output variables are used and in this module sECURITY GROUP ID, LOAD BALANCER ARN is declared as output variable.
