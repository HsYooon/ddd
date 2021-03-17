package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.dto.AddEventDTO;
import com.spring.dto.EventDTO;
import com.spring.dto.SendEventEmailDTO;
import com.spring.dto.UpdateEventDTO;

public interface EventMapper {
	

	
	@Insert("insert into event_info(userNum,eventName,eventDate,alertDate,eventMemo,eventAlarm) values(#{userNum},#{eventName},#{eventDate},#{alertDate},#{eventMemo},#{eventAlarm})")
	void insertEvent(AddEventDTO addEventDTO);

	
	@Select("select * from event_info where userNum = #{userNum}")
	ArrayList<EventDTO> getEventAll(int userNum);
	
	@Delete("delete from event_info where eventNum = #{num}")
	void deleteEvent(int num);
	
	@Select("SELECT a.eventNum, a.userNum, a.eventName,a.eventDate, a.alertDate, a.eventMemo, a.eventAlarm, b.name, b.email " + 
			"FROM event_info as a LEFT JOIN user_info as b " + 
			"ON a.userNum = b.userNum " + 
			"where alertDate=#{time}")
	List<SendEventEmailDTO> selectSendEventEmail(String time);
	
	@Update("update event_info set eventName = #{eventName}, eventMemo=#{eventMemo}, eventAlarm=#{eventAlarm} where eventNum=#{eventNum}")
	void updateEvent(UpdateEventDTO updateEventDTO);

}
