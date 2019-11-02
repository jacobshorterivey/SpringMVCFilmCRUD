package com.skilldistillery.film.dao;

import com.skilldistillery.film.entities.Film;

public interface DatabaseAccessor {
	public Film findFilmById(int filmId);


}
