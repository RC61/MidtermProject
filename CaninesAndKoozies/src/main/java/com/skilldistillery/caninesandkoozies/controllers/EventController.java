package com.skilldistillery.caninesandkoozies.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.EventDAOImpl;
import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.data.VenueDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;
import com.skilldistillery.caninesandkoozies.entities.UserEvent;
import com.skilldistillery.caninesandkoozies.entities.Venue;

@Controller
public class EventController {
	
	@Autowired
	private EventDAOImpl eventDAOImpl;
	
	@Autowired
	private VenueDAOImpl venueDAOImpl;
	
	@Autowired
	private UserDAOImpl userDAOImpl;
	
	@RequestMapping(path = "createEvent.do")
	public ModelAndView createEvent(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = (User) session.getAttribute("user");
		
		if (loggedInUser != null) {
			mv.addObject("user", loggedInUser);
			List<Venue> venues = venueDAOImpl.findAllVenues();
			mv.addObject("venues", venues);
			mv.setViewName("createEvent");
		}
		else {
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	@RequestMapping(path = "forwardEventForCreation.do", params = "id")
	public ModelAndView eventForward(Event event, HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = (User) session.getAttribute("user");
		
		Event newEvent = eventDAOImpl.createEvent(event, loggedInUser, id);
		mv.addObject("event", newEvent);
		mv.setViewName("eventDetails");
		
		
		return mv;
	}
	
	@RequestMapping(path = "updateEvent.do")
	public ModelAndView updateEvent(int id) {
		ModelAndView mv = new ModelAndView();
		
		
		Event toUpdate = eventDAOImpl.findEventById(id);
		

		mv.addObject("event", toUpdate);
		mv.setViewName("updateEvent");
		
		return mv;
	}
	
	@RequestMapping(path="forwardEventForUpdate.do")
	public ModelAndView forwardUpdate(Event event, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Event updated = eventDAOImpl.updateEvent(event);
		
		User loggedInUser = (User) session.getAttribute("user");
		mv.addObject("user", loggedInUser);
		mv.addObject("event", updated);
		mv.setViewName("eventDetails");
		
		return mv;
	}
	
	@RequestMapping(path="deleteEvent.do")
	public ModelAndView deleteEvent(int id) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = eventDAOImpl.destroy(id);
		String printOut;
		if (result == true) {
			printOut = "Your event has been deleted.";
		}
		else {
			printOut = "We cannot delete your event at this time,";
		}
		mv.addObject("result", printOut);
		mv.setViewName("resultEventDelete");
		return mv;
	}
	
	@RequestMapping(path="signUpForEvent.do")
	public ModelAndView signUpForEvent(int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		List<UserEvent> usersEvents = userDAOImpl.addEventToUserEventList(loggedInUser, id);
		mv.addObject(usersEvents);
		mv.addObject("user", loggedInUser);
		return mv;

	}

}
