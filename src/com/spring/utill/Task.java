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
	
//	@Scheduled(fixedRate=10000)
	@Scheduled(cron = "0 5 9 * * *")
	public void sendEventEmail() {
		
	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		Date date = new Date();
		String today = format.format(date);
		List<SendEventEmailDTO> list = eventMapper.selectSendEventEmail(today);
		
		if(list.isEmpty()) {
			System.out.println("list is empty!!");
		}else {
			Iterator<SendEventEmailDTO> iter = list.iterator(); 
			
			while(iter.hasNext()) {
				SendEventEmailDTO dto = iter.next();
				eventMailSendService.sendEventMail(dto);
				
				
			}
		}
		
	}
}
