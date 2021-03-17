package com.spring.dto;

import java.util.ArrayList;
import java.util.List;

import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

public class SenderDTO {
	
	private String from;
    private List<String> to = new ArrayList<>();
    private String subject;
    private String content;
	public String getFrom() {
		return from;
	}
	public List<String> getTo() {
		return to;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public SenderDTO(String from, List<String> to, String subject, String content) {
		
		this.from = from;
		this.to = to;
		this.subject = subject;
		this.content = content;
	}
	
	
	 public SendEmailRequest toSendRequestDto() {
	        Destination destination = new Destination()
	                .withToAddresses(this.to);

	        Message message = new Message()
	                .withSubject(createContent(this.subject))
	                .withBody(new Body().withHtml(createContent(this.content)));

	        return new SendEmailRequest()
	                .withSource(this.from)
	                .withDestination(destination)
	                .withMessage(message);
	    }

	    private Content createContent(String text) {
	        return new Content()
	                .withCharset("UTF-8")
	                .withData(text);
	    }
    
	    
	    @Override
	    public String toString() {
	    	
	    	return "/" + this.getFrom() + "/" + this.getTo().get(0) + "/" + this.getSubject() + "/" + this.getContent();
	    }
    
}
