pipeline {
    agent none
    stages {
        stage('minecraft-build') {
            agent {
                label 'aleksandr-work'
            }
            steps {
                sh 'echo "------------------------- Building -----------------------"'
                sh 'docker build -t zaichegk/minecraft-server:1.14.4 .'
                sh 'echo "------------------------- Build Finished -----------------------"'
            }
        }
        stage('minecraft-deploy') {
            agent {
                label 'aleksandr-work'
            }
            steps {
                sh 'echo "minecraft-deploy"'
                sh 'echo "--------------------------- Deploying -----------------------------"'
                sh 'docker run -d -p 25565:25565 -p 25575:25575 --name mc zaichegk/minecraft-server:1.14.4'
                sh 'echo "------------------------ Deploy finished --------------------------"'
            }
        }
    }
}
