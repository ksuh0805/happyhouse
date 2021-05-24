package com.ssafy.happyhouse.cofiguration;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ssafy.happyhouse.interceptor.ConfirmInterceptor;


@Configuration
@MapperScan(basePackages = "com.ssafy.happyhouse.model.mapper")
public class WebConfiguration implements WebMvcConfigurer{
	@Autowired
	private ConfirmInterceptor confirmInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(confirmInterceptor).addPathPatterns("/board/**");
		registry.addInterceptor(confirmInterceptor).addPathPatterns("/aptdeal/**");
		registry.addInterceptor(confirmInterceptor).addPathPatterns("/chart/**");
		registry.addInterceptor(confirmInterceptor).addPathPatterns("/interest/**");
		registry.addInterceptor(confirmInterceptor).addPathPatterns("/chatPage/**");
	}
}
