FROM ubuntu:22.04

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg software-properties-common && \
    curl -1sLf 'https://dl.redpanda.com/nzc4ZYQK3WRGd9sy/redpanda/cfg/setup/bash.deb.sh' | \
    bash && \
    apt-get install -y redpanda redpanda-console && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure Redpanda Bootstrap
RUN rpk redpanda config bootstrap --self 0.0.0.0:9092 \
    --advertised-kafka quiz-redpanda-docker-45c5f0975162.herokuapp.com:19092 --ips 0.0.0.0,0.0.0.0,0.0.0.0 && \
    rpk redpanda config set redpanda.empty_seed_starts_cluster false

# Expose the required ports
EXPOSE 9092 19092 8082 8081 9644

# Start Redpanda directly (without systemctl)
CMD ["rpk", "redpanda", "start"]