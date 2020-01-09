FROM python:3.6.5-alpine

ENV TZ Asia/Shanghai

WORKDIR /home/

EXPOSE 3030

RUN echo 'http://mirrors.tuna.tsinghua.edu.cn/alpine/v3.6/main' > /etc/apk/repositories && \
    echo 'http://mirrors.tuna.tsinghua.edu.cn/alpine/v3.6/community' >> /etc/apk/repositories && \
    mkdir -p /root/.pip && \
    cd /root/.pip/ && \
    echo '[global]' >> pip.conf && \
    echo 'index-url=https://mirrors.aliyun.com/pypi/simple' >> pip.conf && \
    apk add --update && \
    apk add --no-cache libmagic ca-certificates openssl-dev openssl libffi-dev gcc musl-dev wget && \
    cd /home/ && \
    wget https://github.com/Yelp/elastalert/archive/v0.2.1.zip && \
    unzip v0.2.1.zip && \
    mv elastalert-* elastalert && \
    pip install --upgrade pip && \
    cd /home/elastalert && \
    pip install -r requirements-dev.txt && \
    pip install -r requirements.txt && \
    python setup.py install && \
    touch config.yaml && \
    mkdir rules && \
    touch smtp-auth-file.yaml

CMD elastalert --config /home/elastalert/config.yaml --rule /home/elastalert/rules/  --verbose
     
