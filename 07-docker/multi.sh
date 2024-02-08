#!/bin/bash

docker build -t word-cloud-image -f Dockerfile.multi .
docker run -it --rm -d -p 8888:8888 word-cloud-image