package com.skilldistillery.film.dao;

import java.util.List;

import com.skilldistillery.film.entities.Film;

public interface DatabaseAccessor {
	public Film findFilmById(int filmId);


}
