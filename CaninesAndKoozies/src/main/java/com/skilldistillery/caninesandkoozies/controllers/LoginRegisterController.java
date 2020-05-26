package com.skilldistillery.caninesandkoozies.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.EventDAOImpl;
import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class LoginRegisterController {
	
	@Autowired
	private UserDAOImpl userDAOImpl;
	
	@Autowired
	private EventDAOImpl eventDAOImpl;

	@RequestMapping(path = "login.do", method = RequestMethod.POST, params = {"username", "password"})
	public ModelAndView login(String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = userDAOImpl.getUserByUsernameAndPassword(username, password);
		
		session.setAttribute("user", loggedInUser);

		mv.setViewName("redirect:home.do");
		return mv;
	}

	@RequestMapping(path = "register.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("registration");

		return mv;
	}
	
	@RequestMapping(path = "logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User currentUser = (User) session.getAttribute("user");
		if(currentUser != null) {
			session.removeAttribute("user");
		}
		List<Event> events = eventDAOImpl.findAllEvents();
		mv.addObject("events", events);
		mv.setViewName("index");
		return mv;
	}
}
