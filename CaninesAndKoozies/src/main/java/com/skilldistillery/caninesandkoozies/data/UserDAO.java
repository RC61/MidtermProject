package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.User;

import antlr.debug.Event;

public interface UserDAO {
	public User createUser(User newUser);
	public User updateUser(int id, User user);
	public boolean deleteUser(int id);
	public Dog createDog(Dog newDog);
	public Dog updateDog(int id, Dog dog);
	public boolean deleteDog(int id);
	public List<Dog> findAllUserDogs();
	public Event createEvent(Event newEvent);
	public Event updateEvent(int id, Event event);
	public boolean deleteEvent(int id);
	public List<Event> findAllCreatedEvents();
	
	// HOW DO I WRITE THIS SHIT FOR EVENTS THE USER WILL ATTEND
}
