#!/bin/bash
COMMAND=$1

export TF_VAR_region=${REGION}
#export TF_VAR_stack_version=${STACK_VERSION}
export TF_VAR_webapp_appname=${APP_NAME}
export TF_VAR_live_url=${LIVE_URL}


     echo "****** backend configuration options ************"
     echo "bucket=tf-developer"
     echo "key=${APP_NAME}/${REGION}/${ENVIRONMENT}/live.tfstate"
     echo "profile=developer"
     echo "${REGION}"
     terraform init \
     -backend-config="bucket=tf-developer" \
    # -backend-config="key=${APP_NAME}/${REGION}/${ENVIRONMENT}/${STACK_VERSION}.tfstate" \
     -backend-config="key=${APP_NAME}/${REGION}/${ENVIRONMENT}/live.tfstate" \
     -backend-config="region=${REGION}" \
     -backend-config="profile=developer"

if [ "${COMMAND}" = 'plan' ];
 then
   terraform get -update
   terraform ${COMMAND} -input=false
else
terraform get -update
terraform ${COMMAND} -auto-approve

fi;
