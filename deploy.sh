#!/bin/bash

echo 'executing terraform...'
echo 'executing pass init'
/usr/local/bin/terraform init
/usr/local/bin/terraform plan -input=false

