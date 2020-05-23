package com.skilldistillery.caninesandkoozies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class LoginRegisterController {
	
	@Autowired
	private UserDAOImpl userDAOImpl;

	@RequestMapping(path = "login.do", method = RequestMethod.POST, params = {"username", "password"})
	public ModelAndView login(String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = userDAOImpl.getUserByUsernameAndPassword(username, password);
		
		session.setAttribute("user", loggedInUser);

		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "register.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("registration");

		return mv;
	}
}
