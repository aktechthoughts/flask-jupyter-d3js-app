FROM ubuntu:18.04


RUN apt-get update \
 && apt-get install -y python3-pip  

WORKDIR /

RUN pip3 install --upgrade pip
RUN pip3 install virtualenv

RUN virtualenv app
RUN . app/bin/activate
RUN pip3 install flask 
RUN pip3 install redis 


ENV PATH=/home/ubuntu/.virtualenvs/bin:$PATH

COPY app/ /app/


ENV FLASK_APP app/run.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

