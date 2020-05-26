package com.skilldistillery.caninesandkoozies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.CommentDAOImpl;
import com.skilldistillery.caninesandkoozies.data.EventDAOImpl;
import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Comment;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class CommentController {
	
	@Autowired
	private CommentDAOImpl commentDAOImpl;
	
	@Autowired
	private UserDAOImpl userDAOImpl;
	
	@Autowired
	private EventDAOImpl eventDAOImpl;
	
	@RequestMapping(path="addComment.do")
	public ModelAndView addComment(String description, int userId, int eventId) {
		ModelAndView mv = new ModelAndView();
		
		Comment newComment = commentDAOImpl.createComment(description, userId, eventId);
		
		mv.addObject("event", eventDAOImpl.findEventById(eventId));
		mv.setViewName("eventDetails");
		
		return mv;
	}

}
