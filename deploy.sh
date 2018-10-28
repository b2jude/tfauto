#!/bin/bash
COMMAND=$1
echo 'terraform path.hello.'
which terraform

tf_init () {
     echo "****** backend configuration options ************"
     data "aws_s3_bucket" "backendbucket" {
     bucket = "tf-developer"
     }
     echo "bucket arn : ${data.aws_s3_bucket.backendbucket.name}"
     echo "key=${APP_NAME}/${REGION}/${ENVIRONMENT}/${RELEASE}.tfstate"
     echo "profile=developer"
     echo "${REGION}"
     terraform init \
     backend-config="bucket=${data.aws_s3_bucket.backendbucket.name}" \
     backend-config="key=${APP_NAME}/${REGION}/${ENVIRONMENT}/${RELEASE}.tfstate"
     backend-config="region=${REGION}"
     backend-config="profile=developer"
}


tf_init
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
