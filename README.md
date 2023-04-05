```sh
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
```
##Install the Session Manager plugin on Ubuntu
```sh
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
```
Run the install command.
```sh
sudo dpkg -i session-manager-plugin.deb
```
#Verify the Session Manager plugin installation
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
