package com.skilldistillery.film.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FilmController {

	@RequestMapping(path="home.do")
	public ModelAndView goHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/Views/home.jsp");
		return mv;
	}
}
