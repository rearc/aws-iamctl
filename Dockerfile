FROM python:3.13-alpine

WORKDIR /opt/app

COPY MANIFEST.in README.rst requirements.txt setup.py ./
COPY iamctl/ iamctl/
COPY bin/ bin/

RUN apk add --no-cache git && \
    git init && \
    pip install --no-cache-dir . && \
    rm -rf /root/.cache

ENTRYPOINT [ "iamctl" ]
