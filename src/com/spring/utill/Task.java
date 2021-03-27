package com.spring.utill;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.dto.SendEventEmailDTO;
import com.spring.mapper.EventMapper;
import com.spring.service.EventMailSendService;


@EnableScheduling
@Component
public class Task {
	
	@Autowired
	private EventMailSendService eventMailSendService;
	
	@Autowired
	private EventMapper eventMapper;
	

	@Scheduled(cron = "0 0 18 * * *")
//	@Scheduled(cron = "0 0/1 * * * *")
	public void sendEventEmail() {
		
	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		Date date = new Date();
		String today = format.format(date);
		List<SendEventEmailDTO> list = eventMapper.selectSendEventEmail(today);
		
		if(list.isEmpty()) {
			// 이벤트가 있는 회원이 없을때
		}else {
			Iterator<SendEventEmailDTO> iter = list.iterator(); 
			
			while(iter.hasNext()) {
				SendEventEmailDTO dto = iter.next();
				eventMailSendService.sendEventMail(dto);
								
			}
		}
		
	}
}
