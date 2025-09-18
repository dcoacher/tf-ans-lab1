# tf-ans-lab1
Make your IT Asset Management process simple and controlled. This web-based, runs on Apache complete application for tracking computer equipment, software licenses, and accessories in the organization, will make it happen.

<img src="https://static.vecteezy.com/system/resources/thumbnails/019/153/003/small_2x/3d-minimal-programming-icon-coding-screen-web-development-concept-laptop-with-a-coding-screen-and-a-coding-icon-3d-illustration-png.png" width="350" height="350" />

## New Version (Major Update)
Take a look at the [Previous Version](https://github.com/dcoacher/it-asset-management).<br><br>
In this version Terraform used for IaaC in AWS enrivonment including ELB with 2 EC2 Linux Ubuntu Machines and 1 EC2 Control Machine running Ansible for Managing.

## Data Structure
- :file_folder: *`ansible`* directory contains Ansible EC2 machine deployment script
  - :page_facing_up: *`user-data-ansible.sh`* deployment script
- :file_folder: *`terraform`* directory contains IaaC configuration for AWS
  - :page_facing_up: *`EC2.tf`* configuration file for EC2 Machines
  - :page_facing_up: *`elb.tf`* configuration file for ELB Setting
  - :page_facing_up: *`keypair.tf`* configuration file for KeyPair Creation
  - :page_facing_up: *`network.tf`* configuration file for AWS Network Structure
  - :page_facing_up: *`outputs.tf`* configuration file for Outputs Data Handling
  - :page_facing_up: *`providers.tf`* configuration file for Terraform Providers
  - :page_facing_up: *`sg.tf`* configuration file for Security Groups
  - :page_facing_up: *`variables.tf`* configuration file for Terraform Variables Data
 
## Key Features
- Load Balancer Support for Traffic Handling
- Network Hardening on Application Level by Allowing Only Relevant Traffic (Controlled via SG)
- Network Hardening on Infrastructure Level by Locating EC2 Webapp Instances in Private Subnets
- IaaC Done in Terraform for Easy Environment Deployment in AWS
- EC2 Webapp Instances Control by Ansible Control Host
- Automated Environment Setting by User-Data Script on Ansible Control Host
- Easy Webapp Environment Deploying via Ansible Control Host by Running Automated Playbook

## Deployment and Implementation
1. Start AWS Academy Sandbox and Provide Lab Credentials to variables.tf file variables:
   - `aws_access_key_id`
   - `aws_secret_access_key`
   - `aws_session_token`
2. Run Terraform Commands in Order to Build Infrastructure Environment in AWS:
   - `terraform init`
   - `terraform apply -auto-approve`
3. Connect via SSH or using AWS GUI to the Managing Ansible EC2 Host, located in Public Subnet.
4. Run the playbook on managed web application EC2 Machines in Private Subnets in order to perform relevant installation and start the Webserver: `ansible-playbook playbook.yaml`
5. Verify Access to the Webserver Using ALB DNS Name from Terraform Outputs or from AWS GUI.
6. *Optional:* Verify Health Status of the EC2 Machines in Load Balancer Section via AWS GUI.

## License
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://github.com/dcoacher/tf-ans-lab1/blob/main/LICENSE)

## Author
- Desmond Coacher - [@dcoacher](https://github.com/dcoacher)

## Feedback
If you have any feedback, feel free to contact me via email: 
- [Desmond Coacher](mailto:dcoacher@outlook.com)
