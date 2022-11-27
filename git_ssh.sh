#!/bin/bash

ssh-keygen -t rsa -b 4096 -C "example@mymail.com" -P "" -f "/home/ec2-user/.ssh/id_rsa" -q  
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat /home/ec2-user/.ssh/id_rsa.pub