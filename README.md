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
