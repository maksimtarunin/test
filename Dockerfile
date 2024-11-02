FROM python:3

RUN apt-get -y update && apt-get install -y htop tmux vim nginx supervisor

COPY ./requirements.txt /app/requirements.txt
RUN pip install --upgrade -r /app/requirements.txt

COPY ./app /app
COPY ./config/nginx.conf /etc/nginx/
COPY ./config/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN mkdir -p /logs

CMD ["/usr/bin/supervisord"]