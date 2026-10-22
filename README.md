# AWS VPC + EC2 Nginx Server using Terraform
This is a small project I built while learning Terraform. It creates a VPC form scratch on AWS and launch EC2 instance inside it, with nginx installation automatically. Once it is up, the nginx welcome page opens in the browser.

## What it creates

- A VPC and 2 subnets, one public and second is private
- An Internet Gateway
- A route table, associated with the public subnet
- A security group that allows HTTP (port 80) inbound
- An Ubuntu 24.04 EC2 instance (t3.micro) with a public IP
- Outputs for the public IP and the URL of the server

Region: 'eu-north-1' (Stockholm)

## How it is works

Traffic goes from the internet through the Internet Gateway, then the route table sends it to the public subnet, and the security group let the port 80 though to the EC2 instance. A 'user_data' script installs and starts nginx on first boot. The AMI is picked, so the latest Ubuntu image is used.

## How to run 

You need Terraform and AWS credentials configuration on your machine.
'''bash 
terraform init
terraform plan
terraform apply
'''

After apply finishes, wait couple of minutes and open the "instance_url" shown in the output

## cleanup

'''bash
terraform destroy
'''
## what I learned 

- 'user_data' runs only in the first boot, so changing it later needs 'user_data_replace_on_change = true' or a replace of the instance.
- The package manager has to match the AMI. My first attempt used 'yum' on Ubuntu and nginx never got installed.
- A "connection timed out" error usually pointing to a network problem, while "connection refused" means the network id fine but nothing is listening. Checking /var/log/
  
