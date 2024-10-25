FROM docker.redpanda.com/redpandadata/redpanda:v24.2.7

CMD ["redpanda", "start", \
  "--mode", "dev-container", \
  "--overprovisioned", \
  "--unsafe-bypass-fsync", "true", \
  "--kafka-addr", "internal://0.0.0.0:9092,external://0.0.0.0:19092", \
  "--advertise-kafka-addr", "internal://redpanda-0:9092,external://your-production-domain-or-ip:19092", \
  "--pandaproxy-addr", "internal://0.0.0.0:8082,external://0.0.0.0:18082", \
  "--advertise-pandaproxy-addr", "internal://redpanda-0:8082,external://your-production-domain-or-ip:18082", \
  "--schema-registry-addr", "internal://0.0.0.0:8081,external://0.0.0.0:18081", \
  "--rpc-addr", "redpanda-0:33145", \
  "--advertise-rpc-addr", "redpanda-0:33145", \
  "--smp", "1", \
  "--memory", "4G", \
  "--default-log-level=info"]

EXPOSE 19092 18082 18081 33145