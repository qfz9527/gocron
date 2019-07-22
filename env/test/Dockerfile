FROM ouqg/gocron:latest

ADD ./app.ini /app/conf/app.ini
ADD ./install.lock /app/conf/install.lock

ENTRYPOINT ["/app/gocron", "web"]
