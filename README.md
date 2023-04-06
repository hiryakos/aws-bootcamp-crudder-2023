# Add the file to check health for flask app.py
```sh
@app.route('/api/health-check')
def health_check():
  return {'success': True}, 200
```
# Bashscript for healthcheck
```sh
#!/usr/bin/env python3

import urllib.request

try:
  response = urllib.request.urlopen('http://localhost:4567/api/health-check')
  if response.getcode() == 200:
    print("[OK] Flask server is running")
    exit(0) # success
  else:
    print("[BAD] Flask server is not running")
    exit(1) # false
# This for some reason is not capturing the error....
#except ConnectionRefusedError as e:
# so we'll just catch on all even though this is a bad practice
except Exception as e:
  print(e)
  exit(1) # false
```
# Create Cloudwatch log
```sh
aws logs create-log-group --log-group-name cruddur
aws logs put-retention-policy --log-group-name cruddur --retention-in-days 1
```
# Create ECS Cluster
```sh
aws ecs create-cluster \
--cluster-name cruddur \
--service-connect-defaults namespace=cruddur
```
## Create ECR  repo and puch images 
### Loging to ECR
```sh
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
```
### Base Image for Python
```sh
aws ecr create-repository \
  --repository-name cruddur-python \
  --image-tag-mutability MUTABLE
```


```sh
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
```
# Install the Session Manager plugin on Ubuntu
```sh
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
```
## Run the install command.
```sh
sudo dpkg -i session-manager-plugin.deb
```
### Verify the Session Manager plugin installation
```sh
session-manager-plugin
```
```sh
aws ecs execute-command \
--region $AWS_DEFAULT_REGION \
--cluster cruddur \
--task f94100bcd68a4303a6c17c554b9aef3e \
--container backend-flask \
--command "bin/bash" \
--interactive 
```
