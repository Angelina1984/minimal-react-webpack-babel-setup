#!/usr/bin/env bash

aws --debug cloudformation create-stack --stack-name "$serviceName-stack" \
    --template-body file://${WORKSPACE}/infrastructure/aws/cloudformation/ecs.yml \
    --region 'us-east-1' \
    --parameters ParameterKey=SubnetID,ParameterValue=subnetID \
        ParameterKey=ServiceName,ParameterValue=serviceName \
        ParameterKey=ServiceVersion,ParameterValue=containerVersion
