package com.spring.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.spring.dto.SenderDTO;
import com.spring.dto.user.LoginAuthDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.UserEmailAuthDTO;
import com.spring.repository.UserDAO;
import com.spring.utill.MailUtils;

@Service
public class MailAuthService {
	/*
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private UserDAO userDAO;
	
	private int size;
	
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//인증키 
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	//인증 메일 보내기 
	public String sendAuthMail(String email,LocalDateTime now) {
		String authKey = getKey(6);
		
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다</p>")
					.append("<a href='http://localhost:8080/selectOne_shop/join/signUpConfirm?email=")
					.append(email)
					.append("&authKey=")
					.append(authKey)
					.append("' target='_blenk'>이메일 인증 확인</a>")
					.append("<p>이메일은 ")
					.append(now.plusMinutes(30))
					.append("까지 유효합니다</p>")
					.toString());
			sendMail.SetFrom("sssu0000@gmail.com", "관리자");
			sendMail.setTo(email);
			sendMail.send();
		}catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return authKey;
	}
	
	public void insertAuthKey(UserEmailAuthDTO userEmailAuthDTO) {
		
		//회원가입후 인증키 업데이트 성공시 1반환
		userDAO.insertAuthKey(userEmailAuthDTO);
	}
	
	public UserEmailAuthDTO getAuthKey(String email,String authKey) {
		
		return userDAO.getAuthKey(email,authKey); 
		
	}
	
	//인증 후 로그인 상태 변화
	public int updateAuthStatus(UserEmailAuthDTO userEmailAuthDTO) {
		return userDAO.updateAuthStatus(userEmailAuthDTO);
	}
	
	public LoginAuthDTO getLoginUser(LoginDTO loginDTO) {
		
		return userDAO.getLoginUser(loginDTO);
		
	}

	//발급 인증키 만료시 삭제
	public void deleteAuthKey(String email) {
		userDAO.deleteAuthKey(email);
	}
	*/
	
	@Autowired
	private AmazonSimpleEmailService amazonSimpleEmailService;
	
	@Autowired
	private UserDAO userDAO;
	
	
	private int size;
	
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//인증키 
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}

    
    
    
   
    
  //인증 메일 보내기 
  	public String sendAuthMail(String email,LocalDateTime now) {
  		
  		String authKey = getKey(6);
		
  		MailUtils mailUtils = new MailUtils(); 
		String from = mailUtils.getFrom();
		
		ArrayList<String> to = new ArrayList<>();
		to.add(email);
		 
        String subject = "[planty - 회원가입 인증메일]";
	
        String content = "<div style='margin: 30px 30px;background-color: rgb(252, 245, 235);border: 1px solid #ddd;display: inline-block;padding: 45px 20px;'>" 
        			+ "<p>&#9989; 아래 링크를 클릭하시면 이메일 인증이 완료됩니다</p>"
        		    + "&#8594; <a href='http://54.180.95.234:8888/planty/join/signUpConfirm?email=" + email + "&authKey=" + authKey 
        		    + "'><span style='background-color: rgb(200, 233, 123); font-size: 23px;'>이메일 인증 완료 </span></a>"
        			+ "<p>[이 메일은 <strong>"+ now.plusMinutes(30) + "</strong> 까지 유효합니다]</p></div>";
       
        

  		
  		SenderDTO senderDTO = new SenderDTO(from, to, subject, content);
		amazonSimpleEmailService.sendEmail(senderDTO.toSendRequestDto());
		 
  
  		return authKey;
  	}
  	
  	public void insertAuthKey(UserEmailAuthDTO userEmailAuthDTO) {
  		
  		//회원가입후 인증키 업데이트 성공시 1반환
  		userDAO.insertAuthKey(userEmailAuthDTO);
  	}
  	
  	public UserEmailAuthDTO getAuthKey(String email,String authKey) {
  		
  		return userDAO.getAuthKey(email,authKey); 
  		
  	}
  	
  	//인증 후 로그인 상태 변화
  	public int updateAuthStatus(UserEmailAuthDTO userEmailAuthDTO) {
  		return userDAO.updateAuthStatus(userEmailAuthDTO);
  	}
  	
  	public LoginAuthDTO getLoginUser(LoginDTO loginDTO) {
  		
  		return userDAO.getLoginUser(loginDTO);
  		
  	}

  	//발급 인증키 만료시 삭제
  	public void deleteAuthKey(String email) {
  		userDAO.deleteAuthKey(email);
  	}
	
	
	
}
