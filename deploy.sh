#!/bin/bash
COMMAND=$1
echo 'terraform path.hello.'
which terraform
export TF_VAR_region=${REGION}


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
