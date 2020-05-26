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
	
	@RequestMapping(path="confirmDeleteDog.do")
	public ModelAndView deleteDogConfirm(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		Dog dogDelete = dogDAOImpl.findDogById(id);
		mv.addObject("user", loggedInUser);
		mv.addObject("dog", dogDelete);
		mv.setViewName("deleteDogConfirmationPage");
		return mv;
	}
	
	@RequestMapping(path="deleteDog.do")
	public ModelAndView deleteDog(int id) {
		ModelAndView mv = new ModelAndView();
		boolean result = userDAOImpl.deleteDog(id);
		String printOut;
		if (result == true) {
			printOut = "Your dog has been deleted.";
		}
		else {
			printOut = "We cannot delete your dog at this time.";
		}
		mv.addObject("result", printOut);
		mv.setViewName("dogDeleted");
		return mv;
		
	}
	
	@RequestMapping(path="createDogPage.do")
	public ModelAndView createDogPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser != null) {
			mv.addObject("user", loggedInUser);
			mv.setViewName("createDogPage");
		}
		else {
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	@RequestMapping(path="createDog.do")
	public ModelAndView createDog(HttpSession session, Dog dog) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("user");
		Dog newDog = dogDAOImpl.createDog(dog, loggedInUser);
		mv.addObject("user", loggedInUser);
		mv.addObject("dog", newDog);
		mv.setViewName("userAndDogProfileView");
		return mv;
	}

}
