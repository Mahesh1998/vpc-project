# LOAD BALANCER MODULE
1. Created AWS LOAD BALANCER resource with required parameters.
2. Created Security Group for Load Balancer and configured Ingress and Egress.
3. Created Listeners and Listener rules for Load Balancer.
4. All the parameters are declared as variables and stored in the variables.tf file.
5. Parameter values will be passed to resource while calling the LOAD BALANCER module.
6. To make use of the parameter in different module, the output variables are used and in this module sECURITY GROUP ID, LOAD BALANCER ARN is declared as output variable.
