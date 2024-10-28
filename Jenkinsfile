pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Git Checkout') {
            steps {
                echo 'SCM Checkout'
                git changelog: false, poll: false, url: 'https://github.com/habdulr1/edureka_final_project.git'
            }
        }
        stage('Compile') {
            steps {
                echo 'Compiling the code'
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the Code'
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                echo 'Packaging the artifact'
                sh 'mvn package'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Generating docker image and deploying on K8s cluster from Ansible playbook'
                ansiblePlaybook credentialsId: 'jenkins-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: '/home/ubuntu/deploy_java_app.yml', vaultTmpPath: ''
            }
        }
    }    
}
