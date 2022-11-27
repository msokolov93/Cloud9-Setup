# cloud9setup

<sup>Step 1: Setting up git with SSH access</sup>

Run this script:

```
ssh-keygen -t rsa -b 4096 -C "example@mymail.com" -P "" -f "/home/ec2-user/.ssh/id_rsa" -q  
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat /home/ec2-user/.ssh/id_rsa.pub
```

To test access type:

```
ssh -T git@github.com
```
or
```
git clone git@github.com:msokolov93/tf-static-s3.git
```
