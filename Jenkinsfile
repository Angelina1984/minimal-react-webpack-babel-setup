pipeline {
    agent {
        node {
            label 'centos'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
                sh 'docker run --name minimal-react-webpack-babel-setup -p 4680:8080 -d inalopez/minimal-react-webpack-babel-setup'
            }
        }
    }
}