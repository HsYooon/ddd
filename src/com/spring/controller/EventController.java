package com.spring.controller;

import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.AddEventDTO;
import com.spring.dto.EventDTO;
import com.spring.dto.UpdateEventDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;
	
	@GetMapping("/event")
	public String getEventAll(Model model) {
		int userNum = loginUserBean.getUserNum();
		ArrayList<EventDTO> eventList = eventService.getEventAll(userNum);
		
		Iterator<EventDTO> iter = eventList.iterator();
		while(iter.hasNext()) {
			EventDTO dto = iter.next();
			dto.dateToString();
			dto.setFullDate();
		}
		
		model.addAttribute("eventList", eventList);
		
		return "event";
	}
	@PostMapping("/addEvent")
	public String addEvent(AddEventDTO addEventDTO) {
		
		eventService.insertEvent(addEventDTO);
		return "redirect:/myPage";
	}
	@PostMapping("/updateEvent")
	public String updateEvent(@RequestParam("num") int num, UpdateEventDTO updateEventDTO) {
		
		updateEventDTO.setEventNum(num);
		eventService.updateEvent(updateEventDTO);
		return "redirect:/myPage";
	}
	@GetMapping("/deleteEvent")
	public String deleteEvent(@RequestParam("num") int num) {
		eventService.deleteEvent(num);
		
		return "redirect:/myPage";
	}
	
}
