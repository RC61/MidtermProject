package com.skilldistillery.caninesandkoozies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.caninesandkoozies.data.CommentDAOImpl;

@Controller
public class CommentController {
	
	@Autowired
	private CommentDAOImpl commentDAOImpl;
	
	@RequestMapping(path="addComment.do")
	public ModelAndView addComment() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

}
