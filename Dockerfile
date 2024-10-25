FROM ubuntu:latest

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
     "--kafka-addr", "internal://0.0.0.0:9092,external://0.0.0.0:19092", \
     "--advertise-kafka-addr", "internal://redpanda-0:9092,external://quiz-redpanda-docker-45c5f0975162.herokuapp.com:19092", \
     "--pandaproxy-addr", "internal://0.0.0.0:8082,external://0.0.0.0:18082", \
     "--advertise-pandaproxy-addr", "internal://redpanda-0:8082,external://quiz-redpanda-docker-45c5f0975162.herokuapp.com:18082", \
     "--schema-registry-addr", "internal://0.0.0.0:8081,external://0.0.0.0:18081", \
     "--rpc-addr", "redpanda-0:33145", \
     "--advertise-rpc-addr", "redpanda-0:33145", \
     "--smp", "1", \
     "--memory", "4G", \
     "--default-log-level=info", \
     "--overprovision"]