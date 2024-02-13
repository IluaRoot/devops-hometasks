#!/bin/sh

docker run -v ./files:/var/www/dynamic/ -d --name hometask-static  -p 8081:80 hometask-image
docker exec hometask-static chown www-data:www-data /var/www/dynamic/index.html