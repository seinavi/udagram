#!/bin/bash

# Deploy Networking Stack
aws cloudformation deploy \
  --stack-name networking \
  --template-file network.yml \
  --parameter-overrides file://network-parameters.json \
  --region us-east-1

# Get the output values from the networking stack
VPC_ID=$(aws cloudformation describe-stacks --stack-name networking --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" --output text --region us-east-1)
PUBLIC_SUBNET_1=$(aws cloudformation describe-stacks --stack-name networking --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet1'].OutputValue" --output text --region us-east-1)
PUBLIC_SUBNET_2=$(aws cloudformation describe-stacks --stack-name networking --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet2'].OutputValue" --output text --region us-east-1)
PRIVATE_SUBNET_1=$(aws cloudformation describe-stacks --stack-name networking --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1'].OutputValue" --output text --region us-east-1)
PRIVATE_SUBNET_2=$(aws cloudformation describe-stacks --stack-name networking --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2'].OutputValue" --output text --region us-east-1)

# Deploy Application Stack
aws cloudformation deploy \
  --stack-name udagram \
  --template-file udagram.yml \
  --parameter-overrides \
    VPCId=$VPC_ID \
    PublicSubnet1=$PUBLIC_SUBNET_1 \
    PublicSubnet2=$PUBLIC_SUBNET_2 \
    PrivateSubnet1=$PRIVATE_SUBNET_1 \
    PrivateSubnet2=$PRIVATE_SUBNET_2 \
  --region us-east-1

# Get the Load Balancer DNS Name
LOAD_BALANCER_DNS=$(aws cloudformation describe-stacks --stack-name udagram --query "Stacks[0].Outputs[?OutputKey=='LoadBalancerDNSName'].OutputValue" --output text --region us-east-1)

# Print the Load Balancer URL
echo "Application is available at: $LOAD_BALANCER_DNS"
