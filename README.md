<h1>Terraform Installation</h1>
1 Download the latest version of Terrafrom <br/>
   &nbsp; &nbsp; &nbsp; $wget https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip <br/>
   
2 Now, unzip the download file. <br/>
  &nbsp; &nbsp; &nbsp; $sudo apt install zip -y <br/>
  &nbsp; &nbsp; &nbsp; $sudo unzip terraform_0.14.3_linux_amd64.zip

3 This will output you a terraform file just move it to /usr/local/bin/ to execute the command. <br/>
  &nbsp; &nbsp; &nbsp; $sudo mv terraform /usr/local/bin/

<h1> Jenkins Installation </h1>
1. wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - <br/>
2. sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' <br/>
3. sudo apt-get update <br/>
4. sudo apt-get install jenkins
