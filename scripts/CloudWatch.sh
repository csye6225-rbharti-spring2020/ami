wget https://s3.us-east-1.amazonaws.com/amazoncloudwatch-agent-us-east-1/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb        

sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

sudo systemctl start amazon-cloudwatch-agent.service