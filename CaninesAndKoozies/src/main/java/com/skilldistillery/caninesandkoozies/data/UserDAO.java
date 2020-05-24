package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;


public interface UserDAO {
	public User createUser(User newUser);
	public User updateUser(int id, User user);
	public boolean deleteUser(int id);
	public User findUserById(int id);
	
	public Dog createDog(Dog newDog);
	public Dog updateDog(int id, Dog dog);
	public boolean deleteDog(int id);
	public List<Dog> findAllUserDogs(int id);
	
	public User getUserByUsernameAndPassword(String username, String password);
	
	// DO I KEEP THIS SHIT
	public Event createEvent(Event newEvent);
	public Event updateEvent(int id, Event event);
	public boolean deleteEvent(int id);
	public List<Event> findAllCreatedEvents(int id);
	
	// HOW DO I WRITE THIS SHIT FOR EVENTS THE USER WILL ATTEND
}
