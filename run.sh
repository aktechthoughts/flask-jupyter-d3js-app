#!/bin/bash

docker run -t -d \
          -v /home/abhishek/.aws:/home/root/.aws \
          -v /home/abhishek/projects/python/notebooks:/app/notebooks \
          -p 8888:8888 \
           aktechthoughts/web-ui 
