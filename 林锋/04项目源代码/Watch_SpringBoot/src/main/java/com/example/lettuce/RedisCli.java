package com.example.lettuce;

import io.lettuce.core.RedisClient;
import io.lettuce.core.api.StatefulRedisConnection;

public class RedisCli {
			public static RedisClient redisClient = RedisClient.create("redis://zxcvb0515@192.168.4.173:6379/");
			
			public static StatefulRedisConnection<String, String> connection = redisClient.connect();
}
