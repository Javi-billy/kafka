version: '3.9'
services:
  zookeeper:
    image: confluentinc/cp-zookeeper:latest
    ports:
      - 2181:2181  
    environment:
      ZOOKEEPER_CLIENT_PORT: 2181
      ZOOKEEPER_TICK_TIME: 2000
  kafka1:
    container_name: kafka1
    image: confluentinc/cp-kafka:latest
    ports:
      - 8097:8097
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: EXTERNAL:PLAINTEXT,INTERNAL:PLAINTEXT
      KAFKA_ADVERTISED_LISTENERS: EXTERNAL://localhost:8097,INTERNAL://kafka1:9092
      KAFKA_INTER_BROKER_LISTENER_NAME: INTERNAL
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    depends_on:
      - zookeeper
  kafka2:
    container_name: kafka2
    image: confluentinc/cp-kafka:latest
    ports:
      - 8098:8098
    environment:
      KAFKA_BROKER_ID: 2
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: EXTERNAL:PLAINTEXT,INTERNAL:PLAINTEXT
      KAFKA_ADVERTISED_LISTENERS: EXTERNAL://localhost:8098,INTERNAL://kafka2:9092
      KAFKA_INTER_BROKER_LISTENER_NAME: INTERNAL
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    depends_on:
      - zookeeper    
  kafka-ui:
    image: provectuslabs/kafka-ui:latest
    container_name: kafka-ui
    ports:
      - 8000:8080
    restart: always
    environment:
      KAFKA_CLUSTERS_0_NAME: local
      KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS: kafka1:9092
      KAFKA_CLUSTERS_1_NAME: secondLocal
      KAFKA_CLUSTERS_1_BOOTSTRAPSERVERS: kafka2:9092
    depends_on:
      - zookeeper
      - kafka1
      - kafka2
