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
    ubuntu-ami.json
```

or

```
packer build -var-file=./ami-vars-local.json ubuntu-ami.json
```

## Build AMI on Packer:

1. Make sure to set up the environment variables in CircleCi.
2. Run the following command:

```
packer build ubuntu-ami.json
```
