# lambda-thumbnail-generator

Generating thumbnail when upload image to s3.

## Prepare

- Creating two s3 buckets named `image-source` and `image-resized`
- Creating IAM user to execute lambda function

## Creating a deploy package

#. Create EC2 instance with Amazon Linux.
#. `ssh -i <your-key-pair>.pem ec2-user@<your ec2 public dns>`
#. Setup a python environment.
    #. `virtualenv -p python2.7 venv`
    #. `source venv/bin/activate`
    #. `pip install -U pip`
    #. `sudo yum install libjpeg-devel`
    #. `pip install boto3 pillow -t vendors`
#. Create a zip file
    #. `cd vendors`
    #. `zip -r ../packages.zip *`
#. Download.
    #. `scp -i <your-key-pair>.pem ec2-user@<your ec2 public dns>:~/packages.zip .`
#. Bundle `lambda_function.py`
    #. `zip -g packages.zip lambda_function.py`

