#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisites
sudo apt install -y \
  git

# Install Docker and dependencies
# Add Docker's official GPG key:
sudo apt-get install -y ca-certificates curl

# Add the repository to Apt sources:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --keyring /etc/apt/keyrings/docker.asc --dearmor > /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER


git clone https://github.com/caglakahriman/pyeditorial_cms.git pyeditorial_cms
cd pyeditorial_cms
mkdir -p pgdata

docker compose up -d

echo "** Docker setup complete. PyEditorial project is running in detached mode. **"
