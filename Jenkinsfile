pipeline {
    agent {
        node {
            label 'centos'
        }
    }
    stages {
        stage('Build Docker') {
            steps {
                sh "docker build --pull -f Dockerfile ."
               // sh 'docker run --name minimal-react-webpack-babel-setup -p 4680:443 -d inalopez/minimal-react-webpack-babel-setup'
            }
        }

        stage('Deploy docker image to EC2') {
            steps {
                // sh 'docker run --name minimal-react-webpack-babel-setup -p 4680:443 -d inalopez/minimal-react-webpack-babel-setup'
            }
        }
    }
}