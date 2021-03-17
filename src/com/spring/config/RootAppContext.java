package com.spring.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.context.annotation.SessionScope;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClientBuilder;
import com.spring.dto.user.LoginUserDTO;

//data를 저장하거나 관리 목적으로 사용하는 빈들을 등록함
// Bean 을 정의하는 xml 파일 지정하기
// 프로젝트에서 사용하는 Bean을 정의하는 클래스
// (root-context.xml)

@Configuration
@PropertySource("/WEB-INF/properties/ses.properties")
public class RootAppContext {

	@Bean("loginUserBean")
	//@Bean
	@SessionScope
	public LoginUserDTO loginUserBean() {
		return new LoginUserDTO();
	}
	
	  // 이메일 인증 
	  
	/*
	 * @Bean public JavaMailSender getJavaMailSender() { Properties properties = new
	 * Properties(); properties.put("mail.smtp.auth", true);
	 * properties.put("mail.transport.protocol","smtp");
	 * properties.put("mail.smtp.starttls.enable", true);
	 * properties.put("mail.smtp.starttls.required", true);
	 * properties.put("mail.debug",true);
	 * 
	 * JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	 * mailSender.setHost("smtp.gmail.com"); mailSender.setPort(587);
	 * mailSender.setUsername("");
	 * mailSender.setPassword("");
	 * mailSender.setDefaultEncoding("utf-8");
	 * mailSender.setJavaMailProperties(properties); return mailSender; }
	 */
	  //아마존 이메일 서비스 테스트 파트 
	  
	  
	  	@Value("${credentials.access-key}")
	    private String accessKey;
	  	@Value("${credentials.secret-key}")
	    private String secretKey;
	    
	    
	    @Bean
	    public AmazonSimpleEmailService amazonSimpleEmailService() {
	        BasicAWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKey, secretKey);
	        AWSStaticCredentialsProvider awsStaticCredentialsProvider = new AWSStaticCredentialsProvider(basicAWSCredentials);

	        return AmazonSimpleEmailServiceClientBuilder.standard()
	                .withCredentials(awsStaticCredentialsProvider)
	                .withRegion("ap-northeast-2") 
	                .build();
	    }

}
