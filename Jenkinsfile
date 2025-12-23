
pipeline {
    agent any
    environment {
        AWS_REGION = "ap-south-1"
        ECR_URL = "369878825082.dkr.ecr.ap-south-1.amazonaws.com/cicd-eks-app"
        CLUSTER = "my-eks-cluster"
    }
    stages {
        stage('Checkout') {
            steps { git 'https://github.com/DevRahul16/End-to-End-CICD-Terraform-EKS-Pipeline.git' }
        }
        stage('Ansible Setup') {
            steps {
                sh "echo Ansible setup placeholder"
            }
        }
        stage('Docker Build & Push') {
            steps {
                sh '''
                echo docker login
                echo docker build
                echo docker push
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'echo terraform apply'
            }
        }
        stage('Deploy to EKS') {
            steps {
                sh 'echo kubectl apply'
            }
        }
    }
}
