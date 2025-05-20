#!/bin/bash

# Update the system
sudo yum update -y

# Prompt to install Git
read -p "Do you want to install Git? (yes/no): " install_git
if [[ "$install_git" == "yes" ]]; then
    sudo yum install -y git
    echo "Git installed successfully."
else
    echo "Skipping Git installation."
fi

# Prompt to install Docker
read -p "Do you want to install Docker? (yes/no): " install_docker
if [[ "$install_docker" == "yes" ]]; then
    sudo yum install -y docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "Docker installed and started successfully."
else
    echo "Skipping Docker installation."
fi

# Prompt to install Jenkins
read -p "Do you want to install Jenkins? (yes/no): " install_jenkins
if [[ "$install_jenkins" == "yes" ]]; then
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade -y
    sudo yum install java-17-amazon-corretto -y
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    sudo systemctl status jenkins
    echo "Jenkins installed and started successfully."
else
    echo "Skipping Jenkins installation."
fi

echo "Script execution completed."
