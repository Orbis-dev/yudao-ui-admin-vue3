docker build . -t enterprise-keeper-admin;

docker stop enterprise-keeper-admin;

docker rm enterprise-keeper-admin;

docker run -d -p 80:80 --name enterprise-keeper-admin enterprise-keeper-admin;