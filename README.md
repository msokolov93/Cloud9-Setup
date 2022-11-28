# cloud9setup

## Step 1: Setting up Git with SSH access

#### Run this script:

```
ssh-keygen -t rsa -b 4096 -C "example@mymail.com" -P "" -f "/home/ec2-user/.ssh/id_rsa" -q  
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat /home/ec2-user/.ssh/id_rsa.pub
```

#### In Github: 

Settings -> SSH and GPG keys -> New SSH key -> add output from step 1 -< Add SSH key

![screenshot](https://github.com/msokolov93/cloud9setup/blob/main/Screenshot%202022-11-27%20150807.png?raw=true)

#### To test access type:

```
ssh -T git@github.com
```
or
```
git clone git@github.com:msokolov93/cloud9setup.git
```

## Step 2: Configure Secure Access for Cloud9

### Create IAM entities

#### Create IAM role for Cloud9 with required presmissions and write down role arn
Example: arn:aws:iam::112233445566:role/Cloud9AdminRole

#### Create IAM Policy to further assume this role
Example: Cloud9AssumeRolePolicy

Add your **role ARN** accordingly
```
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": "arn:aws:iam::112233445566:role/Cloud9AdminRole"
    }
}
````

#### Attach policy to IAM Role that you will store keys for
Example: MyUser

Create a new keypair or write down existing **Access key ID** and **Secret access key**

### Configure CLI environment with created keypair

```
export AWS_ACCESS_KEY_ID=**AKIAIOSFODNN7EXAMPLE**
export AWS_SECRET_ACCESS_KEY=**wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY**
``` 
then run command with Cloud9 **Role ARN**:
```
OUT=$(aws sts assume-role --role-arn arn:aws:iam::112233445566:role/Cloud9AdminRole --role-session-name MySessionName);\
export AWS_ACCESS_KEY_ID=$(echo $OUT | jq -r '.Credentials''.AccessKeyId');\
export AWS_SECRET_ACCESS_KEY=$(echo $OUT | jq -r '.Credentials''.SecretAccessKey');\
export AWS_SESSION_TOKEN=$(echo $OUT | jq -r '.Credentials''.SessionToken');
```

After consecutive logins run command to clear session: 
```
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN
```
