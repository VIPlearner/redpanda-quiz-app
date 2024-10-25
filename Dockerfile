FROM docker.redpanda.com/redpandadata/redpanda:v24.2.5

CMD ["redpanda", "start", \
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

EXPOSE 9092 19092 8082 18082 8081 18081 33145