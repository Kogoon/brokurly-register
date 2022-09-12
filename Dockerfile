FROM python:3.8.10
LABEL name="Kogoon"

USER root
WORKDIR /root

RUN apt -y update
RUN apt install -y python3-pip

COPY ./app/ /root/app/
COPY ./config.py /root/config.py
COPY ./migrations /root/migrations
COPY ./requirements.txt /root/requirements.txt

RUN pip install -r requirements.txt

ENV FLASK_APP app
RUN flask db migrate

CMD flask run --host 0.0.0.0 -p 5001