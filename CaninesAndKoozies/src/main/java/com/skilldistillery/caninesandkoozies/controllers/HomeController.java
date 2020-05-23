package com.skilldistillery.caninesandkoozies.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.EventDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class HomeController {
	
	@Autowired
	private EventDAOImpl eventDAOImpl;
	
//	@RequestMapping(path = {"/", "home.do"})
//	public ModelAndView home(HttpSession session) {
//		
//		ModelAndView mv = new ModelAndView();
//		List<Event> events = eventDAOImpl.findAllEvents();
//		mv.addObject("events", events);
//		mv.setViewName("index");
//		User loggedInUser = (User) session.getAttribute("user");
//		if(loggedInUser != null) {
//			mv.addObject("user", loggedInUser);
//		}
//		
//		return mv;
//	}
	
	@RequestMapping(path = {"/", "home.do"})
	private String homehome() {
		return "index";
	}
	
	
}
