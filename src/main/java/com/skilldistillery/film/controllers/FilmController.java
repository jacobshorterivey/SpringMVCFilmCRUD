package com.skilldistillery.film.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.DatabaseAccessorObject;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private DatabaseAccessorObject dao;
	
	@RequestMapping(path="home.do")
	public ModelAndView goHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/WEB-INF/Views/home.jsp");
		return mv;
	}
	
	@RequestMapping(path="results.do")
	public ModelAndView findFilmById(@RequestParam("filmId") int filmId){
		ModelAndView mv = new ModelAndView();
		Film film = dao.findFilmById(filmId);
		
		mv.addObject("film", film);
		mv.setViewName("/WEB-INF/Views/results.jsp");
		return mv;
	}
}
