package com.ssafy.happyhouse.cofiguration;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@MapperScan(basePackages = "com.ssafy.happyhouse.model.mapper")
public class WebConfiguration implements WebMvcConfigurer{
	
}
