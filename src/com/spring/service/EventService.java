package com.spring.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.AddEventDTO;
import com.spring.dto.EventDTO;
import com.spring.dto.UpdateEventDTO;
import com.spring.repository.EventRepository;

@Service
public class EventService {
	
	@Autowired
	private EventRepository eventRepository;
	
	public void insertEvent(AddEventDTO addEventDTO) {
		
		int year = Integer.parseInt(addEventDTO.getYear());
		int month = Integer.parseInt(addEventDTO.getMonth());
		int day = Integer.parseInt(addEventDTO.getDay());
		
		//실제 이벤트 시간
		Timestamp ed = new Timestamp(year-1900, month, day, 12, 0, 0, 0);

		//이벤트 알람시간을 위한 작업
		LocalDateTime date = LocalDateTime.of(year, month+1, day, 9, 0, 0, 0); // 
		LocalDateTime someDaysAgo = date.minusDays(addEventDTO.getEventAlarm()); // 
		
		Timestamp alertDate = Timestamp.valueOf(someDaysAgo);
		
		addEventDTO.setEventDate(ed);
		addEventDTO.setAlertDate(alertDate);
		
		eventRepository.insertEvent(addEventDTO);
		
	}
	
	/*
	 * public SendEmailDTO selectSendEmail(Timestamp time) { return
	 * eventRepository.selectSendEmail(time); }
	 */
	
	public ArrayList<EventDTO> getEventAll(int userNum) {
		return eventRepository.getEventAll(userNum);
	}
	
	public void deleteEvent(int num) {
		eventRepository.deleteEvent(num);
	}
	
	public void updateEvent(UpdateEventDTO updateEventDTO) {
		eventRepository.updateEvent(updateEventDTO);
	}
}
