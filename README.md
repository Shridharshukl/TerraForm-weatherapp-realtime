# Terraform AWS Weather App Deployment

This Terraform project automates the deployment of a Weather Application on AWS EC2, complete with Docker and AWS CLI installation.

## Overview

This project:
- Creates an EC2 instance
- Installs Docker and AWS CLI
- Pulls a weather application container image
- Runs the application on port 3000
- Provides real-time progress monitoring during deployment

## Prerequisites

- [Terraform v1.0+](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) - Installation guide
- AWS account and credentials
- SSH key pair in your AWS region

## Project Structure

```
┌────────────────┐        ┌────────────────┐        ┌────────────────┐
│   main.tf      │────────► Ec2_instance   │────────►  user_data.sh  │
│   (root)       │        │   module       │        │  (bootstrap)   │
└────────────────┘        └────────────────┘        └────────────────┘
                                  │                          │
                                  │                          │
                                  ▼                          ▼
┌────────────────┐        ┌────────────────┐        ┌────────────────┐
│   output.tf    │◄───────│   AWS EC2      │        │  Docker +      │
│   (results)    │        │   Instance     │        │  Weather App   │
└────────────────┘        └────────────────┘        └────────────────┘
                                  │                          │
                                  │                          │
                                  └──────────────────────────┘
                                             │
                                             ▼
                                  ┌────────────────┐
                                  │ Weather App on │
                                  │   Port 3000    │
                                  └────────────────┘
```

```
main.tf       - Main configuration file
output.tf     - Output definitions
user_data.sh  - EC2 setup script
modules/      - EC2 instance module
```

## Quick Start

1. Clone the repo:
   ```bash
   git clone https://github.com/Shridharshukl/TerraForm-weatherapp-realtime.git
   cd TerraForm-weatherapp-realtime
   ```

2. Set up AWS credentials:
   ```bash
   aws configure
   ```

3. Update your SSH key in `main.tf`:
   ```
   key_name  = "your-key-name"
   private_k = "~/path/to/your-key.pem"
   ```

4. Deploy:
   ```bash
   terraform init
   terraform apply -auto-approve
   ```

5. Access the app:
   ```
   http://<instance_public_ip>:3000
   ```

## Customization

- **Infrastructure**: Change region, instance type, or storage in `main.tf`
- **Application**: Modify Docker settings in `user_data.sh`

## Benefits

- Automates infrastructure provisioning
- Streamlines application deployment
- Provides real-time deployment status
- Ensures consistent, repeatable setups
