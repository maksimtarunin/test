FROM python:3

RUN apt-get -y update && apt-get install -y htop tmux vim nginx

COPY ./requirements.txt /app/requirements.txt

COPY ./app /app
COPY ./config/nginx.conf /etc/nginx/

RUN pip install --upgrade -r /app/requirements.txt

#CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8080"]
#CMD ["nginx", "-t"]

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN set -eux; \
        chmod 0700 /docker-entrypoint.sh
STOPSIGNAL SIGQUIT
ENTRYPOINT ["/docker-entrypoint.sh"]
