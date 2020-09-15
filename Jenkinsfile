artifactoryHost = "https://autodesk-docker.art-bobcat.autodesk.com"
buildContainerVersion = "1.0"
dockerContainerRepoName="team-web-platform-engineering-docker"
serviceName = "minimal-react-webpack"
imageName = "${dockerContainerRepoName}/${serviceName}"
fullImageName = artifactoryHost + "/" + imageName
    
    
pipeline {
    agent {
        node {
            label 'aws-centos'
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

        stage("Build and Push Docker image") {
            steps {
                script {
                    docker.withRegistry(artifactoryHost, 'svc_d_artifactory'){
                        def customImage = docker.build("${imageName}:${buildContainerVersion}")
                        customImage.push()
                    }
                }
            }
        }


        stage('Deploy image to AWS') {
            steps {
                script {
                    withAWS(credentials: 'aws_wpesvcs_dev', region: 'us-east-1') {
                        withEnv(["serviceName=${serviceName}","containerVersion=${buildContainerVersion}","subnetID='subnet-123456789'"]) {
                            sh "ls -la ./jenkins/scripts"
                            sh "source ./jenkins/scripts/uploadCloudFormation.sh"
                        }
                    }
                }
            }
        }
    }
}
