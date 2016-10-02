# lambda-thumbnail-generator

Generating thumbnail when upload image to s3.

## Prepare

- Creating two s3 buckets named `image-source` and `image-resized`
- Creating IAM user to execute lambda function

## Creating a deploy package

1. Create EC2 instance with Amazon Linux.
2. `ssh -i <your-key-pair>.pem ec2-user@<your ec2 public dns>`
    - `sudo yum install python27-devel python27-pip gcc`
    - `sudo yum install libjpeg-devel zlib-devel`
3. Setup a python environment.
    - `virtualenv -p python2.7 venv`
    - `source venv/bin/activate`
    - `pip install -U pip`
    - `pip install pillow`
        - When using Pillow, `pip install pillow -t vendors` cannot be avairable. :(
        - `boto3` has already avairable in AWS Lambda
4. Create a zip file
    - `cd venv/lib64/site-packages/`
        - `venv/lib` is not required when just using pillow.
    - `zip -r ~/packages.zip *`
5. Download.
    - `scp -i <your-key-pair>.pem ec2-user@<your ec2 public dns>:~/packages.zip .`
6. Bundle `lambda_function.py`
    - `zip -g packages.zip lambda_function.py`

## References

- [Using AWS Lambda with S3(ja)](https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/with-s3.html)

