#! /bin/bash

yum update
yum install nginx
systemctl start nginx
systemctl enable nginx
systemctl restart nginx