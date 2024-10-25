FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y curl gnupg software-properties-common && \
    curl -1sLf \
  'https://dl.redpanda.com/nzc4ZYQK3WRGd9sy/redpanda/cfg/setup/bash.deb.sh' \
  | bash && \
    apt-get install -y redpanda && \
    apt-get update && \
    apt-cache policy redpanda && \
    apt-get install -y redpanda && \
    apt-get clean

EXPOSE 9092 19092 8082 8081 9644

CMD ["redpanda", "start", \
     "--kafka-addr", "internal://0.0.0.0:9092,external://0.0.0.0:19092"]