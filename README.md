# cloud9setup

## Step 1: Setting up Git with SSH access

Run this script:

```
ssh-keygen -t rsa -b 4096 -C "example@mymail.com" -P "" -f "/home/ec2-user/.ssh/id_rsa" -q  
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat /home/ec2-user/.ssh/id_rsa.pub
```

In Github: 

Settings -> SSH and GPG keys -> New SSH key -> add output from step 1

![screenshot](https://github.com/msokolov93/cloud9setup/blob/main/Screenshot%202022-11-27%20150807.png?raw=true)

To test access type:

```
ssh -T git@github.com
```
or
```
git clone git@github.com:msokolov93/cloud9setup.git
```
