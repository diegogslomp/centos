# centos

Centos8 docker image with ssh:

```
docker build -t centos .
docker run -d -p 2222:22 centos
ssh -p 2222 root@localhost
# pass: newpass
```
