pipeline {
    agent any

    environment {
        TF_VERSION = "1.6.0"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/your-username/terraform-jenkins-pipeline.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo "Terraform successfully applied."
            sh 'ls -la output'
        }
        failure {
            echo "Pipeline failed."
        }
    }
}

