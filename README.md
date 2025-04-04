# Terraform AWS Weather App Deployment

This Terraform project automates the deployment of a Weather Application on AWS EC2, complete with Docker and AWS CLI installation.

## 🚀 Overview

This project:
- Provisions an **EC2 instance** on AWS
- **Installs Docker and AWS CLI** automatically
- **Pulls and runs a weather application container**
- **Exposes the application on port 3000**
- Provides **real-time deployment progress** monitoring

## 📌 Prerequisites

Before starting, ensure you have:
- **[Terraform v1.0+](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)** installed
- An **AWS account** with proper credentials
- An **SSH key pair** created in your AWS region

## 📂 Project Structure

```
.
├── main.tf        # Main Terraform configuration file
├── output.tf      # Defines Terraform outputs
├── user_data.sh   # Script for EC2 instance setup
├── modules/       # Contains the EC2 instance module
│   ├── main.tf    # EC2 module configuration
│   ├── output.tf  # Module output values
│   └── variable.tf# Module input variables
├── terraform.tfstate  # Terraform state file
├── terraform.tfstate.backup  # Backup of Terraform state
└── README.md      # Project documentation
```

### 📊 Deployment Architecture
```
┌────────────────┐        ┌────────────────┐        ┌────────────────┐
│   main.tf      │────────► Ec2_instance   │────────►  user_data.sh  │
│   (root)       │        │   module       │        │  (bootstrap)   │
└────────────────┘        └────────────────┘        └────────────────┘
                                  │                          │
                                  ▼                          ▼
┌────────────────┐        ┌────────────────┐        ┌────────────────┐
│   output.tf    │◄───────│   AWS EC2      │        │  Docker +      │
│   (results)    │        │   Instance     │        │  Weather App   │
└────────────────┘        └────────────────┘        └────────────────┘
                                  │                          │
                                  └──────────────────────────┘
                                             │
                                             ▼
                                  ┌────────────────┐
                                  │ Weather App on │
                                  │   Port 3000    │
                                  └────────────────┘
```

## 🚀 Quick Start

1️⃣ **Clone the repository**:
   ```bash
   git clone https://github.com/Shridharshukl/TerraForm-weatherapp-realtime.git
   cd TerraForm-weatherapp-realtime
   ```

2️⃣ **Set up AWS credentials**:
   ```bash
   aws configure
   ```

3️⃣ **Update your SSH key in `main.tf`**:
   ```hcl
   key_name  = "your-key-name"
   private_k = "~/path/to/your-key.pem"
   ```

4️⃣ **Deploy the infrastructure**:
   ```bash
   terraform init
   terraform apply -auto-approve
   ```

5️⃣ **Access the application**:
   ```
   http://<instance_public_ip>:3000
   ```

## 🔧 Customization

- **Modify Infrastructure**: Update region, instance type, or storage in `main.tf`.
- **Customize the Application**: Edit the `user_data.sh` script to adjust Docker settings.

## ✅ Benefits

- **Automated Infrastructure**: No manual AWS setup required
- **Effortless Application Deployment**: Runs the weather app seamlessly
- **Consistent & Repeatable**: Ensures reliable deployments
- **Real-time Monitoring**: Provides instant feedback on the deployment status

---

### 🤝 Contributing
Feel free to submit issues and pull requests to improve this project!

### 📜 License
This project is open-source and available under the **MIT License**.

🚀 **Happy Coding!** 🎉

