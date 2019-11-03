package com.skilldistillery.film.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class DatabaseAccessorObject implements DatabaseAccessor {

	// FIELDS

	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false";

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// CONSTRUCTORS

	// METHODS

	@Override
	public Film findFilmById(int filmId) {
		Film film = null;
		String user = "student";
		String password = "student";
		String sql = "SELECT category.name, film.id, film.language_id, film.rental_duration, film.length, film.rental_rate, film.special_features, "
				+ "film.replacement_cost, film.title, film.release_year, film.rating, film.description, language.name FROM film LEFT JOIN film_category"
				+ " on film.id = film_category.film_id LEFT JOIN category on film_category.category_id = category.id" 
				+ " JOIN language ON film.language_id = language.id WHERE film.id = ?";

		try {
			Connection conn = DriverManager.getConnection(URL, user, password);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet filmResult = stmt.executeQuery();

			if (filmResult.next()) {
				film = new Film();
				film.setId(filmResult.getInt("film.id"));
				film.setTitle(filmResult.getString("film.title"));
				film.setReleaseYear(filmResult.getInt("film.release_year"));
				film.setRating(filmResult.getString("film.rating"));
				film.setDescription(filmResult.getString("film.description"));
				film.setLanguageId(filmResult.getInt("film.language_id"));
				film.setCategory(filmResult.getString("category.name"));
				film.setRentalDuration(filmResult.getInt("film.rental_duration"));
				film.setRentalRate(filmResult.getDouble("film.rental_rate"));
				film.setLength(filmResult.getInt("film.length"));
				film.setReplacementCost(filmResult.getDouble("film.replacement_cost"));
				film.setSpecialFeatures(filmResult.getString("film.special_features"));
				film.setLanguage(filmResult.getString("language.name"));

				film.setActorsInFilm(findActorsByFilmId(filmId));

				filmResult.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return film;
	}

	public Actor findActorById(int actorId) {
		Actor actor = null;
		String user = "student";
		String password = "student";
		String sql = "SELECT id, first_name, last_name FROM actor WHERE id = ?";

		try {
			Connection conn = DriverManager.getConnection(URL, user, password);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			ResultSet actorResult = stmt.executeQuery();

			if (actorResult.next()) {
				actor = new Actor(); // Create the object
				// Here is our mapping of query columns to our object fields:
				actor.setId(actorResult.getInt("id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));

				actorResult.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return actor;
	}

	public List<Actor> findActorsByFilmId(int filmId) {
		Actor actor = null;
		List<Actor> actors = new ArrayList<>();
		String user = "student";
		String password = "student";

		try {
			Connection conn = DriverManager.getConnection(URL, user, password);
			String sql = "SELECT id, first_name, last_name FROM actor JOIN film_actor ON actor.id = film_actor.actor_id "
					+ " WHERE film_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				actor = new Actor(); // Create the object
				// Here is our mapping of query columns to our object fields:
				actor.setId(rs.getInt("id"));
				actor.setFirstName(rs.getString("first_name"));
				actor.setLastName(rs.getString("last_name"));
				actors.add(actor);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actors;
	}

	public List<Film> findFilmByKeyword(String keyword) {
		Film film = null;
		List<Film> films = new ArrayList<>();
		String user = "student";
		String password = "student";
		String sql = "SELECT category.name, film.id, film.language_id, film.rental_duration, film.length, film.rental_rate, film.special_features, "
				+ "film.replacement_cost, film.title, film.release_year, film.rating, film.description, language.name FROM film JOIN film_category"
				+ " on film.id = film_category.film_id JOIN category on film_category.category_id = category.id" 
				+ " JOIN language ON film.language_id = language.id WHERE film.title "
				+ "LIKE ? OR film.description LIKE ?";

		try {
			Connection conn = DriverManager.getConnection(URL, user, password);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			ResultSet filmResult = stmt.executeQuery();

			while (filmResult.next()) {
				film = new Film();
				film.setId(filmResult.getInt("film.id"));
				film.setTitle(filmResult.getString("film.title"));
				film.setReleaseYear(filmResult.getInt("film.release_year"));
				film.setRating(filmResult.getString("film.rating"));
				film.setDescription(filmResult.getString("film.description"));
				film.setLanguageId(filmResult.getInt("film.language_id"));
				film.setLanguage(filmResult.getString("language.name"));
				film.setRentalDuration(filmResult.getInt("film.rental_duration"));
				film.setRentalRate(filmResult.getDouble("film.rental_rate"));
				film.setLength(filmResult.getInt("film.length"));
				film.setCategory(filmResult.getString("category.name"));
				film.setReplacementCost(filmResult.getDouble("film.replacement_cost"));
				film.setSpecialFeatures(filmResult.getString("film.special_features"));
				film.setActorsInFilm(findActorsByFilmId(film.getId()));

				films.add(film);
			}
			filmResult.close();
			stmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return films;
	}

	public Film createFilm(Film film) {
		String user = "student";
		String password = "student";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, password);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "INSERT INTO film (film.title, film.release_year, film.rating, film.description, film.language_id, "
					+ "film.rental_duration, film.rental_rate, film.length, film.replacement_cost) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setInt(2, film.getReleaseYear());
			stmt.setString(3, film.getRating());
			stmt.setString(4, film.getDescription());
			stmt.setInt(5, film.getLanguageId());
			stmt.setInt(6, film.getRentalDuration());
			stmt.setDouble(7, film.getRentalRate());
			stmt.setInt(8, film.getLength());
			stmt.setDouble(9, film.getReplacementCost());

			int updateCount = stmt.executeUpdate();
			if (updateCount == 1) {
				ResultSet keys = stmt.getGeneratedKeys();
				if (keys.next()) {
					int newFilmId = keys.getInt(1);
					film.setId(newFilmId);
					if (film.getActorsInFilm() != null && film.getActorsInFilm().size() > 0) {
						sql = "INSERT INTO film_actor (film_id, actor_id) VALUES (?,?)";
						stmt = conn.prepareStatement(sql);
						for (Actor actor : film.getActorsInFilm()) {
							stmt.setInt(1, newFilmId);
							stmt.setInt(2, actor.getId());
							updateCount = stmt.executeUpdate();

						}
					}
				}
			} else {
				film = null;
			}
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting film " + film);
		}
		return film;
	}

	public boolean deleteFilm(Film film) {
		String user = "student";
		String password = "student";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, password);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "DELETE FROM film_actor WHERE film_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			@SuppressWarnings("unused")
			int updateCount = stmt.executeUpdate();
			sql = "DELETE FROM film WHERE film.id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			updateCount = stmt.executeUpdate();

			conn.commit(); // COMMIT TRANSACTION

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

	public boolean editFilm(Film old, Film update) {
		String user = "student";
		String password = "student";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, password);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "UPDATE film SET film.title=?, film.release_year=?, film.rating=?, film.description=?, film.language_id=?,"
					+ " film.rental_duration=?, film.rental_rate=?, film.length=?, film.replacement_cost=?, film.special_features=? WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, update.getTitle());
			stmt.setInt(2, update.getReleaseYear());
			stmt.setString(3, update.getRating());
			stmt.setString(4, update.getDescription());
			stmt.setInt(5, update.getLanguageId());
			stmt.setInt(6, update.getRentalDuration());
			stmt.setDouble(7, update.getRentalRate());
			stmt.setInt(8, update.getLength());
			stmt.setDouble(9, update.getReplacementCost());
			stmt.setString(10, update.getSpecialFeatures());
			stmt.setInt(11, old.getId());

			int updateCount = stmt.executeUpdate();
			if (updateCount == 1) {
				conn.commit(); // COMMIT TRANSACTION
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} // ROLLBACK TRANSACTION ON ERROR
				catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}
}
