package com.spring.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dto.user.LoginAuthDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.UserEmailAuthDTO;
import com.spring.service.MailAuthService;
import com.spring.service.UserService;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MailAuthService mailAuthService;

	
	@GetMapping("/join/checkUserId/{id}")
		public String checkUserId(@PathVariable String id) {
			boolean chkResult = userService.checkUserId(id);
			return chkResult + "";
  }
	
	@PostMapping("/join/emailAuth")
	public String emailAuth(@RequestBody LoginDTO loginDTO) {	
		
		LoginAuthDTO loginAuthDTO = mailAuthService.getLoginUser(loginDTO);
		String password = loginDTO.getPw1();
//		System.out.println("db꺼->" + loginAuthDTO.getEmail());
//		System.out.println("보낸거->" + password);
//		System.out.println("db 비번->" + loginAuthDTO.getPw());
		if (passwordEncoder.matches(password,loginAuthDTO.getPw()) == true) {
			String result = Integer.toString(loginAuthDTO.getUserNum()) + "&" + loginAuthDTO.getEmail();
			
			return result;
		}
		return "error";
	
	}
	
	@PostMapping("/join/resendEmail")
	public String resendEmail(@RequestBody Map<String, Object> map) {
		
	
		List list = new ArrayList<String>();
		list = (List) map.get("info");
		String userNum = (String) list.get(0);
		String email = (String) list.get(1);
		// 해당 이메일의 발급키 삭제 
		mailAuthService.deleteAuthKey(email);
		
		// 새로운 발급 키 추가 
		
		//메일 인증 발송 
		LocalDateTime now = LocalDateTime.now();
		String authKey = mailAuthService.sendAuthMail(email,now);
		UserEmailAuthDTO userEmailAuthDTO = new UserEmailAuthDTO(Integer.parseInt(userNum),email,authKey,now,0); //authoSatus = 0 인증전
			
		// db업데이트 하기 UserEmailAuthDTO이용하기 
		mailAuthService.insertAuthKey(userEmailAuthDTO);
			
		
		return "success";
	}

}
