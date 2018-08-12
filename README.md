# no-ip-ddns-client
Docker image for running No-IP DDNS client.

The goal of this is to be a tiny image (under 5MB) and to support environment variable supplied username/password.

## Run
```
docker container run -d --restart always -e 'USERNAME=name@example.com' -e 'PASSWORD=s3cret' micahzoltu/no-ip-ddns-client
```
