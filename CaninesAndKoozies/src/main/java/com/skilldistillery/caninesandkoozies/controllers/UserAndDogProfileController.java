package com.skilldistillery.caninesandkoozies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.DogDAOImpl;
import com.skilldistillery.caninesandkoozies.data.UserDAOImpl;
import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.User;

@Controller
public class UserAndDogProfileController {
	
	@Autowired
	private UserDAOImpl userDAOImpl;
	@Autowired
	private DogDAOImpl dogDAOImpl;
	
	@RequestMapping(path="dogUpdatedPage.do")
	public ModelAndView updateDogPage(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		Dog dogUpdate = dogDAOImpl.findDogById(id);
		mv.addObject("user", loggedInUser);
		mv.addObject("dog", dogUpdate);
		mv.setViewName("updateDogProfile");
		return mv;
	}
	
	@RequestMapping(path="updateDog.do")
	public ModelAndView updateDogInfo(HttpSession session, Dog dog) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		Dog updatedDog = userDAOImpl.updateDog(dog.getId(), dog);
		mv.addObject("user", loggedInUser);
		mv.addObject("dog",updatedDog);
		mv.setViewName("userAndDogProfileView");
		return mv;
		
	}

}
