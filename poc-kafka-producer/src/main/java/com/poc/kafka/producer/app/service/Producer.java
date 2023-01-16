package com.poc.kafka.producer.app.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class Producer {

	private final Logger logger = LoggerFactory.getLogger(Producer.class);
	private static final String TOPIC = "userss";

	private final KafkaTemplate kafkaTemplate;
	
	public Producer(KafkaTemplate kafkaTemplate) {
	        this.kafkaTemplate = kafkaTemplate;
	    }


	public void sendMessage(String message) {
	    logger.info(String.format("#### Producing message %s", message));
	    this.kafkaTemplate.send(TOPIC, message);
	}
}
