#!/bin/bash

# Get current authenticated user
if [ $SUDO_USER ]; then user=$SUDO_USER; else user=`whoami`; fi
if [ $user ]; then user=$user; fi

# VirtualBox
# http://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/
if [ -f /etc/fedora-release ]; then
    ## Fedora 21/20/19/18/17/16/15/14/13/12 users
    if [ ! -f /etc/yum.repos.d/virtualbox.repo ]; then
        sudo wget -c -t 3 -O /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
    fi
else
    ## CentOS 7.1/6.6/5.11 and Red Hat (RHEL) 7.1/6.6/5.11 users
    if [ ! -f /etc/yum.repos.d/virtualbox.repo ]; then
        sudo wget -c -t 3 -O /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
    fi
fi

sudo yum -y update

sudo yum -y install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms

## CentOS 7 and RHEL 7 ##
#rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

## CentOS 6 and RHEL 6 ##
#rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

## CentOS 5 and RHEL 5 ##
#rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm


## Current running kernel on Fedora ##
KERN_DIR=/usr/src/kernels/`uname -r`

## Current running kernel on CentOS and Red Hat (RHEL) ##
#KERN_DIR=/usr/src/kernels/`uname -r`-`uname -m`

## Export KERN_DIR ##
export KERN_DIR

sudo yum -y install VirtualBox-4.3

#/etc/init.d/vboxdrv setup
sudo service vboxdrv setup

sudo usermod -a -G vboxusers $user

# Extension pack
#wget http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack

exit $?
