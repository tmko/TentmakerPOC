#!/bin/bash

# Specify your AWS region and other parameters
REGION="us-west-2"
INSTANCE_TYPE="t2.micro"
AMI_ID="ami-0c94955ba95c71c99" # Specify the ID of the Amazon Machine Image (AMI) to use
KEY_NAME="my-keypair"
SECURITY_GROUP_ID="sg-1234567890abcdef0" # Specify the ID of the security group to use
SUBNET_ID="subnet-1234567890abcdef0" # Specify the ID of the subnet to use

# Generate a timestamp for the AWS signature
TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ)

# Generate the AWS signature
SIGNATURE=$(echo -n "POST
ec2.$REGION.amazonaws.com
/
host:ec2.$REGION.amazonaws.com
x-amz-date:$TIMESTAMP
x-amz-target:EC2.RunInstances

host;x-amz-date;x-amz-target
$(echo -n "host;x-amz-date;x-amz-target" | sha256sum | awk '{ print $1 }')" | openssl sha256 -hmac "AWS4$AWS_SECRET_ACCESS_KEY" -binary | xxd -p)

echo $SIGNATURE

# Make the CreateInstances API request using curl
#curl -X POST https://ec2.$REGION.amazonaws.com/ \
#  -H "Content-Type: application/x-amz-json-1.1" \
#  -H "Authorization: AWS4-HMAC-SHA256 Credential=$AWS_ACCESS_KEY_ID/$TIMESTAMP/$REGION/ec2/aws4_request, SignedHeaders=host;x-amz-date;x-amz-target, Signature=$SIGNATURE" \
#  -H "x-amz-date: $TIMESTAMP" \
#  -H "x-amz-target: EC2.RunInstances" \
#  -d '{
#    "ImageId": "'$AMI_ID'",
#    "InstanceType": "'$INSTANCE_TYPE'",
#    "KeyName": "'$KEY_NAME'",
#    "SecurityGroupIds": ["'$SECURITY_GROUP_ID'"],
#    "SubnetId": "'$SUBNET_ID'",
#    "MinCount": 1,
#    "MaxCount": 1
#}'

#ansible-playbook -Dvi inventories/aws playbook_ambari_compile.yml