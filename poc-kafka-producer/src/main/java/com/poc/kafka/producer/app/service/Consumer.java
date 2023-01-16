package com.poc.kafka.producer.app.service;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class Consumer {

	private final Logger logger = LoggerFactory.getLogger(Producer.class);

	@KafkaListener(topics = "userss", groupId = "group_id")
	public void consume(String message) throws IOException {
	    logger.info(String.format("1 -- #### Consumed message %s", message));
	}
	
}
