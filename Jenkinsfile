pipeline {
    agent any

    stages {
        stage('Pull code from git') {
            steps {
                git branch: 'main', url: 'https://github.com/cyony95/devopspoc'
            }
        }
    

        stage('Deploy and configure environment') {
            steps {
                echo 'Installing and configuring web servers VMs'
                bat 'vagrant up --provision'
                echo 'Building loadbalancer Docker image and deploying loadbalancer Docker container'
                powershell '.\\nginxcontainer.ps1'
            }
        }
    

        stage('Test environment') {
            steps {
                echo 'Testing environment'
                powershell '.\\tests.ps1'
            }
        }
    }
}
