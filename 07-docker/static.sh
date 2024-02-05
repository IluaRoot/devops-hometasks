#!/bin/bash

docker run --rm -d --name hometask-static -p 8081:80 hometask-image
docker exec hometask-static mv /var/www/dynamic/index.html_off /var/www/dynamic/index.html
