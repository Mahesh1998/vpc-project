# AWS IAC Products
It offers modules for the AWS Networking and Compute resources which can be reused.
# Terraform Installation
1. Download the latest version of Terrafrom <br/>
   &nbsp; &nbsp; &nbsp; $wget https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip <br/>
   
2. Now, unzip the download file. <br/>
  &nbsp; &nbsp; &nbsp; $sudo apt install zip -y <br/>
  &nbsp; &nbsp; &nbsp; $sudo unzip terraform_0.14.3_linux_amd64.zip

3. This will output you a terraform file just move it to /usr/local/bin/ to execute the command. <br/>
  &nbsp; &nbsp; &nbsp; $sudo mv terraform /usr/local/bin/

# Jenkins Installation
1. wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - <br/>
2. sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' <br/>
3. sudo apt-get update <br/>
4. sudo apt-get install jenkins

# Terraform Provider
1. Terrafom Version: 0.15.4
2. AWS Provider Version: ~> 3.0
3. AWS Region can be confiured by user in **terraform.tfvars** file

# Terraform Backend
1. Here **AWS S3** remote backend is used for storing state file and state lock is achieved using **DynamoDB**.
2. Create S3 bucket and DynamoDB table and configured it in **backend.tf** file.

# Root Module
Here all the child modules are called in main terraform file by passing values and resources will be created as per the input data mentioned in terraform.tfvars
### VPC Module
1. The VPC module is being called by the parent module.
2. This module is used for vpc creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars

### Public Subnet Module
1. The Subnet module is being called by the parent module.
2. This module is used for Public Subnet creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. The count property is used to create multiple subnets.
6. The **Map_Public_Ip_On_Launch** parameter value will be set to "True" for Public Subnet.

### Private Subnet Module
1. The Subnet module is being called by the parent module.
2. This module is used for  Private Subnet creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. The count property is used to create multiple subnets.
6. The **Map_Public_Ip_On_Launch** parameter value will be set to "False" for Private Subnet.

### Internet Gateway Module
1. The Internet Gateway module is being called by the parent module.
2. This module is used for Internet Gateway creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.


### NAT Gateway Module
1. The NAT Gateway module is being called by the parent module.
2. This module is used for NAT Gateway creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. Public Subnet Id is derived from the output variable of public_subnet module.

### Public Route Table Module
1. The Public Route Table module is being called by the parent module.
2. This module is used for Public Route Table creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.

### Private Route Table Module
1. The Private Route Table module is being called by the parent module.
2. This module is used for Private Route Table creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.

### Public Route Table Routes Module
1. The Public Route Table Routes module is being called by the parent module.
2. This module is used for Public Route Table Routes creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. Public Route Table Id is derived from the output variable of public_route_table module.
6. Internet Gateway Id is derived from the output variable of internet_gateway module.

### Private Route Table Routes Module
1. The Private Route Table Routes module is being called by the parent module.
2. This module is used for Private Route Table Routes creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. Private Route Table Id is derived from the output variable of private_route_table module.
6. NAT Gateway Id is derived from the output variable of nat_gateway module.

### Public Route Table Subnet Assosciation
1. The Public Route Table Subnet Assosciation module is being called by the parent module.
2. This module is used for Public Route Table Subnet Assosciation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. Public Subnet Ids is derived from the output variable of public_subnet module.
6. Public Route Table Id is derived from the output variable of public_route_table module.

### Private Route Table Subnet Assosciation
1. The Private Route Table Subnet Assosciation module is being called by the parent module.
2. This module is used for Private Route Table Subnet Assosciation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. Private Subnet Ids is derived from the output variable of private_subnet module.
6. Private Route Table Id is derived from the output variable of private_route_table module.

### RDS Module
1. The RDS module is being called by the parent module.
2. This module is used for RDS creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.
6. Private Subnet Ids is derived from the output variable of private_subnet module.

### Load Balancer Listener Default Target Group Module
1. The Target Group module is being called by the parent module.
2. This module is used for Load Balancer Listener Default Target Group creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.

### Application Load Balancer Module
1. The Application Load Balancer module is being called by the parent module.
2. This module is used for Application Load Balancer creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.
6. Public Subnet Ids is derived from the output variable of public_subnet module.
7. Target Group ARN is derived from the output variable of load_balancer_listener_default_target_group module

### Auto Scaling Group Module
1. The Auto Scaling Group module is being called by the parent module.
2. This module is used for Auto Scaling Group creation
3. The values of variables declared in child module are passed in this module.
4. Input for variables is passed using terraform.tfvars
5. VPC Id is derived from the output variable of vpc module.
6. Private Subnet Ids is derived from the output variable of private_subnet module.
7. Target Group ARN is derived from the output variable of load_balancer_listener_default_target_group module
