# Terraform Project: AWS VPC, Subnets, Security Group, and EC2 Instance

## Overview

In this project, I used Terraform to automate the creation of several AWS resources, including:
- A **default VPC** in the selected region.
- **Two subnets** (one public and one private).
- A **security group** to allow SSH and HTTP traffic.
- An **EC2 instance** running Amazon Linux 2.


## Steps and Explanation

### 1. **Using the Default VPC**
The first step was to select the **default VPC** in the region. 

### 2. **Creating Subnets**
- **Public Subnet**: This subnet allows internet access for resources within it. I created a public subnet and configured it to automatically assign a public IP to instances launched within it.
  
- **Private Subnet**: This subnet does not have direct internet access. It is used to host resources that should remain isolated from public internet traffic.

### 3. **Configuring the Security Group**
To secure the EC2 instance, I created a **security group**. This security group acts as a virtual firewall for the instance, controlling inbound and outbound traffic.
- I allowed **SSH (port 22)** so that I could connect to the instance using a terminal.
- I also allowed **HTTP (port 80)**, which is essential for serving web traffic.

### 4. **Creating the EC2 Instance**
Next, I created an **EC2 instance** using the **Amazon Linux 2 AMI** and **t2.micro** instance type. This instance was launched in the public subnet and attached to the previously created security group, allowing it to accept SSH and HTTP traffic.

## Screenshots

### 1. **Terraform Plan Output**
![Terraform Plan Output](terraform-sol\images\plan.png)
### 2. **AWS Console: VPC and Subnets**
![AWS Console VPC and Subnets](terraform-sol/images/subnets.png)

### 3. **AWS Console: EC2 Instance**
![AWS Console EC2](terraform-sol/images/ec2.png)

### 4. **Security Group Settings**
![AWS Console Security Group](terraform-sol/images/sg.png)

