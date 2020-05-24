package com.skilldistillery.caninesandkoozies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView registerUser(User user, Address address) {
		ModelAndView mv = new ModelAndView();
		User createdUser = userDAOImpl.createUser(user, address);
		mv.addObject("user", createdUser);
		mv.setViewName("registrationDog");

		return mv;
	}

	@RequestMapping(path = "registerUsersDog.do")
	public ModelAndView registerDog(Dog dog) {
		ModelAndView mv = new ModelAndView();
		Dog createdDog = dogDAOImpl.createDog(dog);
		mv.addObject("dog", createdDog);
		mv.setViewName("userAndDog");

		return mv;
	}
}
