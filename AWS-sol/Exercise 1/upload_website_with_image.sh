#!/bin/bash

# Variables
BUCKET_NAME="aws-task-headway"
INDEX_FILE="index.html"
IMAGE_FILE="hello.png"

#Create an index.html file with custom content that includes the image
echo "<html><body><h1>Hello from Mariam Mahmoud's Website!</h1><p>This is a static website hosted on S3.</p><img src='$IMAGE_FILE' alt='Custom Image'></body></html>" > $INDEX_FILE

#Upload the index.html file to the S3 bucket
aws s3 cp $INDEX_FILE s3://$BUCKET_NAME/

#Upload the image file to the S3 bucket
aws s3 cp $IMAGE_FILE s3://$BUCKET_NAME/

#Output success message
echo "The index.html file and $IMAGE_FILE have been uploaded to the S3 bucket: $BUCKET_NAME"

