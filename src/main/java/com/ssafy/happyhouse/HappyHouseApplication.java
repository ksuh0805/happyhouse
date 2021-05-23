package com.ssafy.happyhouse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class HappyHouseApplication {

	public static void main(String[] args) {
		SpringApplication.run(HappyHouseApplication.class, args);
	}

}
