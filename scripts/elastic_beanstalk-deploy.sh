#!/bin/bash

SHA1=$1


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${DIR}/ebs_setup_variables.sh


#These environment variables comes from your settings in your CircleCI project
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set default.region $AWS_DEFAULT_REGION
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY


DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json

#The name of the zip file that gets uploaded to the bucket
ZIP_FILE=app-$SHA1.zip


sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json > $DOCKERRUN_FILE

#zip up the whole thing
zip $ZIP_FILE -r Dockerrun.aws.json webroot scripts ".ebextensions"

#copy zip file to the bucket
aws s3 cp $ZIP_FILE s3://$EB_BUCKET/$ZIP_FILE

#update version label
aws elasticbeanstalk create-application-version --application-name $APPLICATION_NAME --version-label $SHA1 --source-bundle S3Bucket=$EB_BUCKET,S3Key=$ZIP_FILE

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment --environment-name $ENVIRONMENT_NAME --version-label $SHA1
