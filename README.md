# AWS AMI for CSYE 6225

## Validate Template

```
packer validate ubuntu-ami.json
```

## Build AMI

```
packer build \
    -var 'aws_access_key=REDACTED' \
    -var 'aws_secret_key=REDACTED' \
    -var 'aws_region=us-east-1' \
    -var 'subnet_id=REDACTED' \
    -var 'aws_ami_users=REDACTED' \
    -var 'aws_bucket_name=REDACTED' \
    ubuntu-ami.json
```

or

```
packer build -var-file=./ami-vars-local.json ubuntu-ami.json
```

## Build AMI on CircleCI using Packer:

1. Make sure to set up the environment variables used below in CircleCi.
2. Run the following command as a job in CircleCi's Config:

```
>
packer build -var 'aws_access_key='${aws_access_key}
-var 'aws_secret_key='${aws_secret_key}
-var 'aws_region='${aws_region}
-var 'aws_source_ami='${aws_source_ami}
-var 'aws_ami_users='${aws_ami_users}
-var 'aws_bucket_name='${aws_bucket_name}
ubuntu-ami.json
```

---
