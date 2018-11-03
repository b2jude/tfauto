#!/bin/bash
COMMAND=$1

export TF_VAR_region=${REGION}
export TF_VAR_release=${RELEASE}
export TF_VAR_webapp_appname=${APP_NAME}

     echo "****** backend configuration options ************"
     echo "bucket=tf-developer"
     echo "key=${APP_NAME}/${REGION}/${ENVIRONMENT}/${RELEASE}.tfstate"
     echo "profile=developer"
     echo "${REGION}"
     terraform init \
     -backend-config="bucket=tf-developer" \
     -backend-config="key=${APP_NAME}/${REGION}/${ENVIRONMENT}/${RELEASE}.tfstate" \
     -backend-config="region=${REGION}" \
     -backend-config="profile=developer"

if [ "${COMMAND}" = 'plan' ];
 then

   terraform ${COMMAND} -input=false
else

terraform ${COMMAND} -auto-approve

fi;
