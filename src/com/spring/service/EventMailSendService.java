package com.spring.service;

import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.spring.dto.SendEventEmailDTO;
import com.spring.dto.SenderDTO;
import com.spring.utill.MailUtils;

@Service
public class EventMailSendService {
	
	/*
	 * @Autowired private JavaMailSenderImpl mailSender;
	 */
	
	@Autowired
	private AmazonSimpleEmailService amazonSimpleEmailService;
	
	public void sendEventMail(SendEventEmailDTO dto) {
		/*
		
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[PLANTY] 이벤트알림 - '" + dto.getEventName()+"'가 얼마 남지 않았어요!");
			sendMail.setText(new StringBuffer().append("<h1>")
					.append(dto.getName())
					.append("님! 이벤트 알림이왔어요</h1>")
					.append("<h3> 설정하신 기념일이 ")
					.append(dto.getEventAlarm())
					.append("일 후입니다! Planty에 오셔서 이벤트를 준비하세요!</h3>")
					.append("<a href='http://localhost:8080/selectOne_shop/'> PlANTY 둘러보기 </a>")
					.toString());
			sendMail.SetFrom("sssu0000@gmail.com", "관리자");
			sendMail.setTo(dto.getEmail());
			sendMail.send();
		}catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		
  		String from = "sssu0000@gmail.com";
  		ArrayList<String> to = new ArrayList<>();
        to.add(dto.getEmail());
        String subject = "[이벤트알림] " + dto.getEventName()+ "가 얼마 남지 않았어요!";
        String content = "<h1>" + dto.getName() + "님! 이벤트 알림이 도착했어요 </h1>" + "설정하신 기념일 '" 
        		+ dto.getEventName() + "'이 " + dto.getEventAlarm() + "일 후입니다! <br>" 
        		+ "사이트에 방문해 이벤트를 준비해보세요! <br>" + "<a href='http://localhost:8080/selectOne_shop/'> PlANTY 보러가기 </a>";        
       
        SenderDTO senderDTO = new SenderDTO(from, to, subject, content);
        
        amazonSimpleEmailService.sendEmail(senderDTO.toSendRequestDto());
		
		
		
	}
	
}
