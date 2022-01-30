#!/bin/bash

echo "yum update..."
  yum -y update

echo "Installing VIM..."
  yum -y install vim

echo "Installing GIT..."
  yum -y install git

echo "Installing group 'Development Tools'..."
  yum -y groupinstall "Development Tools"

echo "Installing some libs..."
  yum -y install ntp zlib zlib-devel sqlite-devel httpd mysql-server mysql-devel curl-devel httpd-devel apr-devel apr-util-devel mlocate manlibxml2-devel libxslt-devel libffi-devel readline-devel

echo "Installing RVM..."
  curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable

echo "Installing epel..."
  rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

echo "Installing ruby 1.9.3..."
  rvm install 1.9.3

echo "Logging in..."
  /bin/bash --login

echo "Installing mysql-devel..."
  # for installing gem mysql2
  yum -y install mysql-devel

echo "Installing mysql-server..."
  yum -y install mysql-server

echo "Adding mysql to the startup process..."
  chkconfig mysqld on

echo "Starting mysql..."
  service mysql start

echo "Installing ImageMagic..."
  yum -y install ImageMagick

echo "Installing passenger 3.0.19..."
  #gem install passenger
  gem install passenger --version '3.0.19'

echo "Installing curl devel..."
  yum -y install curl-devel

echo "Running passenger installation script for nginx..."
echo "select 1"
echo "select /opt/nginx"
  passenger-install-nginx-module

echo "Symlinking nginx config to /etc/nginx.."
  ln -s /opt/nginx/conf /etc/nginx

echo "Moving nginx logs to /var/log/nginx and symlinking /opt/nginx/logs to it..."
  mv /opt/nginx/logs /var/log/nginx && ln -s /var/log/nginx /opt/nginx/logs

echo "Liniking nginx binary to /usr/sbin..."
  ln -s /opt/nginx/sbin/nginx /usr/sbin/

echo "Creating nginx init file"
  cp centos/etc/init.d/nginx /etc/init.d/
  chmod u+x /etc/init.d/nginx

echo "Adding nginx to the startup process..."
  chkconfig nginx on

