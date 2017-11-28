#!/bin/bash

echo "init server system..."

echo "set hosts..."
echo "10.33.45.57 poc001-catalonix.com" >> /etc/hosts
echo "10.33.0.188 poc002-catalonix.com" >> /etc/hosts
echo "10.33.10.45 poc003-catalonix.com" >> /etc/hosts

echo "ssh key setting .."

mkdir ~/.ssh
chmod 700 ~/.ssh

cp .ssh/id_rsa.pub ~/.ssh/authorized_keys
cp .ssh/id_rsa ~/.ssh/id_rsa

chmod 600  ~/.ssh/id_rsa
chmod 644  ~/.ssh/authorized_keys

echo "elpl repository..."
rpm -qa epel-release
yum list epel-release
yum -y install epel-release

echo "pip install .."
yum -y install python-pip


echo " install ansible..."
yum -y install ansible

mkdir ~/.ansible
cp ansible_hosts ~/.ansible/hosts
echo "export ANSIBLE_INVENTORY=~/.ansible/hosts" >> ~/.bashrc
export ANSIBLE_INVENTORY=~/.ansible/hosts

echo "install git ..."
yum -y install git

echo "clone system_script..."
mkdir ~/git_repo
cd ~/git_repo

git config --global user.name "Catalonix Server"
git config --global user.email "poc@catalonix.com"
git clone git@github.com:soungno/system_script.git

