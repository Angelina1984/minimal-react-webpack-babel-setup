artifactoryHost = "sten-docker.art-bobcat.sten.com"
buildContainerVersion = "1.0"
imageName = "team-docker/minimal-react-webpack-babel-setup"
fullImageName = artifactoryHost + "/" + imageName
versionedImageName = fullImageName  + ":" + buildContainerVersion
    
    
pipeline {
    agent {
        node {
            label 'build-internal-use-containers'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh "npm install"
            }
        }

        stage('Test') {
            steps {
                sh "npm test"
            }
        }

        stage('Build Docker image') {
            steps {
                sh "docker build -t ${versionedImageName} ."
            }
        }

        stage("Push Docker image") {
            steps {
                script {
                    docker.withRegistry("https://"+ artifactoryHost,'svc_d_artifactory'){
                      sh """
                          docker push ${versionedImageName}
                        """
                    }
                }
            }
        }

        stage('Deploy image to AWS') {
            steps {
                script {
                    docker.withRegistry(httpsPrefix + artifactoryHost, 'svc_d_artifactory'){
                        withAWS(credentials: "aws_vcs_dev_vpc", region: "us-east-1") {
                            sh './gradlew awsCfnMigrateStack awsCfnWaitStackComplete -PsubnetId=$SUBNET_ID -PdockerHubUsername=$DOCKER_HUB_LOGIN_USR -Pregion=$REGION'
                        }
                    }
                }
            }
        }
    }
}
