#!/bin/bash
COMMAND=$1
echo "You are deploying ${SUBSYSTEM} \n"
echo "Your COMMAND is: ${COMMAND}"

export TF_VAR_region=${REGION}
export TF_VAR_appname=${APP_NAME}
export TF_VAR_stack_version=${STACK_VERSION}

     echo "****** backend configuration options ************"


     echo "bucket=tf-developer"
     echo "key=${APP_NAME}/${SUBSYSTEM}/${REGION}/${ENVIRONMENT}/${STACK_VERSION}.tfstate"
     echo "profile=developer"
     echo " REGION: ${REGION}"
     echo "APP_NAME: ${APP_NAME}"
     echo "SUBSYSTEM: ${SUBSYSTEM}"
     echo "ENVIRONMENT: ${ENVIRONMENT}"
     echo "STACK_VERSION: ${STACK_VERSION}"
     echo "`pwd`"
     rm -Rf ./.terraform
     echo "`pwd`"

     which terraform

     terraform init \
     -backend-config="bucket=tf-developer" \
     -backend-config="key=${APP_NAME}/${SUBSYSTEM}/${REGION}/${ENVIRONMENT}/${STACK_VERSION}.tfstate" \
     -backend-config="region=${REGION}" \
     -backend-config="profile=developer"

    echo "backend created"


#/usr/local/bin/terraform init
#terraform init

if [ "${COMMAND}" = 'plan' ];
 then
   #/usr/local/bin/terraform ${COMMAND} -input=false
   terraform ${COMMAND} -input=false
else
#/usr/local/bin/terraform ${COMMAND} -auto-approve
terraform ${COMMAND} -auto-approve
#/usr/local/bin/terraform $apply -auto-approve
#/usr/local/bin/terraform destroy -auto-approve
fi;
