package com.spring.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.AddEventDTO;
import com.spring.dto.EventDTO;
import com.spring.dto.UpdateEventDTO;
import com.spring.mapper.EventMapper;

@Repository
public class EventRepository {
	
	@Autowired
	private EventMapper eventMapper;
	
	public void insertEvent(AddEventDTO addEventDTO) {
		
		eventMapper.insertEvent(addEventDTO);
	}

	public ArrayList<EventDTO> getEventAll(int userNum){
		return eventMapper.getEventAll(userNum);
	}
	
	public void deleteEvent(int num) {
		eventMapper.deleteEvent(num);
	}
	
	public void updateEvent(UpdateEventDTO updateEventDTO) {
		eventMapper.updateEvent(updateEventDTO);
	}
	
	/*
	 * public SendEmailDTO selectSendEmail(Timestamp time) { return
	 * eventMapper.selectSendEventEmail(time); }
	 */
}
