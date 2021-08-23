pipeline {
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any
    stages  {
        stage("Git Checkout") {
            steps {
                git 'https://github.com/Mahesh1998/vpc-project.git'
            }
        }
        stage("Terraform init") {
            steps {
                sh 'terraform init'
            }
        }
        stage("Terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage("Terraform Run") {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
