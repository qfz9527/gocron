FROM golang


MAINTAINER LIUGUAN <1443690671@qq.com>

# 配置时区
ENV TZ=Asia/Shanghai

WORKDIR /go/src/github.com/ouqiang/

RUN git clone -b lingdian git@github.com:qfz9527/gocron.git gocron && \
    cd /go/src/github.com/ouqiang/gocron && \
	go build -tags gocron -o gocron 

## add user
RUN useradd  gonode  -M  -s /sbin/nologin 

## add supervisor
RUN apt-get update && apt-get -y install supervisor vim &&  mkdir -p /var/log/supervisor 

## cp supervisord.conf

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
