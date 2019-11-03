package com.skilldistillery.film.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.DatabaseAccessorObject;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private DatabaseAccessorObject dao;

	@RequestMapping(path = "results.do")
	public ModelAndView findFilmById(@RequestParam("filmId") int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = dao.findFilmById(filmId);

		mv.addObject("film", film);
		mv.setViewName("WEB-INF/Views/results.jsp");
		return mv;
	}

	@RequestMapping(path = "addfilm.do", method = RequestMethod.POST)
	public ModelAndView addFilm(@RequestParam("filmTitle") String title,
			@RequestParam("description") String description, @RequestParam("releaseYear") int releaseYear,
			@RequestParam("language") int languageId, @RequestParam("rentalDuration") int rentalDuration,
			@RequestParam("rentalRate") double rentalRate, @RequestParam("length") int length,
			@RequestParam("replacementCost") double replacementCost, @RequestParam("rating") String rating,
			@RequestParam(value="specialFeatures", required = false) String specialFeatures) {
		ModelAndView mv = new ModelAndView();
		Film film = new Film(title, description, releaseYear, languageId, rentalDuration, rentalRate, length,
				replacementCost, rating, specialFeatures);
		film = dao.createFilm(film);

		mv.addObject("film", film);
		mv.setViewName("WEB-INF/Views/results.jsp");
		return mv;
	}

	@RequestMapping(path = "deletefilm.do", method = RequestMethod.POST)
	public ModelAndView deleteFilm(@RequestParam("filmId") int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = dao.findFilmById(filmId);
		
		boolean wasSuccessful = dao.deleteFilm(film);
		if(wasSuccessful) {
			mv.setViewName("index.html");
		}
		else {
			mv.setViewName("WEB-INF/Views/error.jsp");
		}

		return mv;
	}
	@RequestMapping(path = "editfilmform.do", method = RequestMethod.GET)
	public ModelAndView editFilmForm(@RequestParam("filmId") int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = dao.findFilmById(filmId);

		mv.addObject("film", film);
		mv.setViewName("WEB-INF/Views/editfilmform.jsp");

		
		return mv;
	}
	@RequestMapping(path = "editfilm.do", method = RequestMethod.POST)
	public ModelAndView editFilmDisplay(@RequestParam("filmId") int filmId, @RequestParam("filmTitle") String title,
			@RequestParam("description") String description, @RequestParam("releaseYear") int releaseYear,
			@RequestParam("language") int languageId, @RequestParam("rentalDuration") int rentalDuration,
			@RequestParam("rentalRate") double rentalRate, @RequestParam("length") int length,
			@RequestParam("replacementCost") double replacementCost, @RequestParam("rating") String rating,
			@RequestParam(value="specialFeatures", required = false) String specialFeatures) {
		ModelAndView mv = new ModelAndView();
		Film old = dao.findFilmById(filmId);
		Film update = new Film(filmId ,title, description, releaseYear, languageId, rentalDuration, rentalRate, length, replacementCost, rating, specialFeatures);
		
		boolean wasSuccessful = dao.editFilm(old, update);
		if(wasSuccessful) {
			mv.addObject("film", update);
			mv.setViewName("WEB-INF/Views/results.jsp");
		}
		else {
			mv.setViewName("WEB-INF/Views/error.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "filmbykeyword.do")
	public ModelAndView findFilmByKeyword(@RequestParam("keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		List<Film> films = dao.findFilmByKeyword(keyword);

		mv.addObject("films", films);
		mv.setViewName("WEB-INF/Views/keywordresults.jsp");
		return mv;
	}
	
}
