# Notes

## How to connect

aws.pem is basically my private key.

```bash
chmod 400 aws.pem # (only my local user has read access)
ssh -i "aws.pem" ubuntu@18.216.173.218
```

## TODO

### Terminate the instance

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-clean-up-your-instance
