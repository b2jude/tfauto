#!/bin/bash
COMMAND=$1
echo 'executing terraform...'
echo 'executing pass init'
/usr/local/bin/terraform init
if [ "${COMMAND}" = "plan"];
 then
   /usr/local/bin/terraform ${COMMAND} -input=false
else
/usr/local/bin/terraform ${COMMAND} -auto-approve
#/usr/local/bin/terraform $apply -auto-approve 
#/usr/local/bin/terraform destroy -auto-approve
fi;
