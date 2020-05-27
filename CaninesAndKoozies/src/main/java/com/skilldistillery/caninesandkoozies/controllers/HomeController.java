package com.skilldistillery.caninesandkoozies.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.EventDAOImpl;
import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class HomeController {

	@Autowired
	private EventDAOImpl eventDAOImpl;
	@Autowired
	private UserDAOImpl userDAOImpl;

	@RequestMapping(path = { "/", "home.do" })
	private ModelAndView homehome(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		System.out.println(loggedInUser);
		if (loggedInUser != null) {
			List<Event> eventsCreated = userDAOImpl.findAllCreatedEvents(loggedInUser.getId());
			List<Event> events = userDAOImpl.findAllUsersEvents(loggedInUser.getId());
			mv.addObject("user", loggedInUser);
			mv.addObject("eventsCreated", eventsCreated);
			mv.addObject("events", events);
			System.out.println(eventsCreated);
			System.out.println(events);
		}else {
			List<Event> events = eventDAOImpl.findAllEvents();
			mv.addObject("events", events);
		}
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path= "nightCapNightCap.do")
	private ModelAndView ncnc() {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("nightCatNightCap");
	return mv;
}
}
