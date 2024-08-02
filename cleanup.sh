#!/bin/bash

# Delete Application Stack
aws cloudformation delete-stack --stack-name udagram --region us-east-1

# Wait for the application stack to be deleted
aws cloudformation wait stack-delete-complete --stack-name udagram --region us-east-1

# Delete Networking Stack
aws cloudformation delete-stack --stack-name networking --region us-east-1

# Wait for the networking stack to be deleted
aws cloudformation wait stack-delete-complete --stack-name networking --region us-east-1

echo "Udagram infrastructure has been deleted."
