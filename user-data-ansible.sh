#!/bin/bash
add-apt-repository universe
apt update
apt install -y ansible python3 python3-pip python3-venv git

mkdir -p /etc/ansible


# Create Ansible hosts file (Inventory)
cat <<EOF > /etc/ansible/hosts

[app]
10.10.2.10
10.10.3.10

[app:vars]
ansible_user=ubuntu
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=/home/ubuntu/KP.pem

[all:vars]
ansible_ssh_common_args=-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null

EOF

# Create ansible.cfg file
cat <<EOF > /etc/ansible/ansible.cfg



[defaults]
inventory = /etc/ansible/hosts

EOF