```sh
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
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
