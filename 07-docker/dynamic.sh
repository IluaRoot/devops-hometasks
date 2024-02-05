#!/bin/bash

docker build -t hometask-image -f Dockerfile .
docker run -d --rm --name hometask-dynamic -p 8080:80 hometask-image