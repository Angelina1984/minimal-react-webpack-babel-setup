#!/usr/bin/env bash

aws cloudformation create-stack --stack-name "$project.name-stack" \
    --template-body file://../../aws/cloudformation/ecs.yml \
    --region 'us-east-1' \
    --parameters ParameterKey=SubnetID,ParameterValue='subnet-09f3f7d31f77ca503' \
        ParameterKey=ServiceName,ParameterValue=project.name \
        ParameterKey=ServiceVersion,ParameterValue=project.version \
        ParameterKey=DockerHubUsername,ParameterValue=dockerHubUsernameProperty
