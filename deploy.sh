#!/bin/bash
COMMAND=$1
echo 'terraform path..'
which terraform

/usr/local/bin/terraform init
if [ "${COMMAND}" = 'plan' ];
 then
   /usr/local/bin/terraform ${COMMAND} -input=false
else
/usr/local/bin/terraform ${COMMAND} -auto-approve
#/usr/local/bin/terraform $apply -auto-approve 
#/usr/local/bin/terraform destroy -auto-approve
fi;
