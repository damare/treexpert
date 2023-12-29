# syntax=docker/dockerfile:1
FROM python:3.8.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install libaio1 -y
RUN mkdir -p /opt/oracle
RUN curl -L "https://download.oracle.com/otn_software/linux/instantclient/2112000/instantclient-basic-linux.x64-21.12.0.0.0dbru.zip" -o /opt/oracle/ic.zip
RUN unzip /opt/oracle/ic.zip -d /opt/oracle
RUN sh -c "echo /opt/oracle/instantclient_21_12 > /etc/ld.so.conf.d/oracle-instantclient.conf"
RUN ldconfig


WORKDIR /code
RUN python --version
RUN pip install --upgrade pip
COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY . /code/

RUN ["chmod", "+x", "docker-entrypoint.sh"]
ENTRYPOINT ["sh", "docker-entrypoint.sh"]
CMD "python manage.py runserver 0.0.0.0:8000"
