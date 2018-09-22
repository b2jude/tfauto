#!/bin/sh

echo 'executing terraform...'
terraform init
echo 'executing pass init'

terraform plan

