#!/bin/bash

docker build . -t wkhtmltopdf
docker run -v /tmp/:/mnt/host/ -it wkhtmltopdf:latest cp /root/wkhtmltopdf.zip /mnt/host/wkhtmltopdf.zip
cp /tmp/wkhtmltopdf.zip ./