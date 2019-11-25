#!/bin/bash

docker build -t levess007/nginx ./nginx-image
docker run -d -p 80:80 -p 443:443 levess007/nginx

