package com.skilldistillery.caninesandkoozies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.DogDAOImpl;
import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Address;
import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class RegistrationForUserAndDogController {

	@Autowired
	private UserDAOImpl userDAOImpl;
	@Autowired
	private DogDAOImpl dogDAOImpl;

	@RequestMapping(path = "registerUser.do")
	public ModelAndView registerUser(User user, Address address, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User createdUser = userDAOImpl.createUser(user, address);
		session.setAttribute("user", createdUser);
		mv.addObject("user", createdUser);
		mv.setViewName("registrationDog");

		return mv;
	}

	@RequestMapping(path = "registerUsersDog.do", method = RequestMethod.POST)
	public ModelAndView registerDog(Dog dog, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User dogUser = (User)session.getAttribute("user");
		Dog createdDog = dogDAOImpl.createDog(dog, dogUser);
		mv.addObject("user", dogUser);
		mv.addObject("dog", createdDog);
		mv.setViewName("userAndDog");

		return mv;
	}
}
