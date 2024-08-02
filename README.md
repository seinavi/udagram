# Udagram Infrastructure Deployment

This project provisions the required infrastructure and deploys a dummy application for an Instagram-like app called Udagram.

## Files
- `network.yml`: CloudFormation template for networking resources
- `network-parameters.json`: Parameters file for the networking stack
- `udagram.yml`: CloudFormation template for application resources
- `udagram-parameters.json`: Parameters file for the application stack
- `deploy.sh`: Script to deploy the infrastructure
- `cleanup.sh`: Script to cleanup the infrastructure

## Instructions

### Deploying the Infrastructure
1. Ensure you have AWS CLI configured with appropriate permissions.
2. Run the deployment script:
   ```bash
   ./deploy.sh

### Cleanup the Infrastructure
1. Ensure you have AWS CLI configured with appropriate permissions.
2. Run the deployment script:
   ```bash
   ./cleanup.sh
