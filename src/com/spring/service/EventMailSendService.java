package com.spring.service;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

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
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		
		MailUtils mailUtils = new MailUtils(); 
		String from = mailUtils.getFrom();
  		ArrayList<String> to = new ArrayList<>();
        to.add(dto.getEmail());
        String subject = "[이벤트알림] " + dto.getEventName()+ "가 얼마 남지 않았어요!";
        
        String content = "<div style='margin: 30px 30px;background-color: rgb(237, 252, 235);border: 1px solid #ddd;display: inline-block;padding: 40px 20px;'>" + 
        			  "<p>&#9989; 설정하신 이벤트 <span style='font-size:20px;font-weight:bold'>"+dto.getEventName()+"</span>이 <span  style='font-size:20px;font-weight:bold'>"+dto.getEventAlarm()+"일 후</span>입니다</p>" + 
        			  "   &#8594; <a href=''><span style='background-color: rgb(200, 233, 123); font-size: 23px;'>플랜티 바로가기 </span></a>" + 
        			  "<table style='border-spacing: 10px;margin:15px 20px;border: 5px solid rgb(247, 165, 98);'>" + 
        			  "<tr style='padding: 10px 20px;font-size: 15px;'>" + 
        			  "<td style='padding: 5px;border-bottom: 3px solid rgb(247, 165, 98); color: rgb(252, 143, 55);'>EVENT</td>" + 
        			  "<td style='padding: 5px;border-bottom: 3px solid rgb(247, 165, 98); color: rgb(252, 143, 55);'>D-Day</td>" + 
        			  "</tr><tr>" + 
        			  "<td>"+dto.getEventName()+"</td>" + 
        			  "<td>"+dto.getEventDate() +"</td>" + 
        			  "</tr></table></div>";
        
        SenderDTO senderDTO = new SenderDTO(from, to, subject, content);
        
        amazonSimpleEmailService.sendEmail(senderDTO.toSendRequestDto());
		
		
		
	}
	
}
