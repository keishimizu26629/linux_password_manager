FROM ubuntu:21.10

RUN apt-get update && \
    apt-get install -y gnupg && \
    rm -rf /var/lib/apt/lists/*

COPY password_manager.sh /usr/src/app/
