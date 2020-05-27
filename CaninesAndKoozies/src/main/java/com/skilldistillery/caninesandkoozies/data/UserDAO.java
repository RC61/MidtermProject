package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Address;
import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;
import com.skilldistillery.caninesandkoozies.entities.UserEvent;


public interface UserDAO {
	public User createUser(User newUser, String bday, Address address);
	public User updateUser(int id, User user, Address address) ;
	public boolean deleteUser(int id);
	public User findUserById(int id);
	public List<User> findUserByKeyword(String keyword);
	
	public Dog createDog(Dog newDog);
	public Dog updateDog(int id, Dog dog);
	public boolean deleteDog(int id);
	public List<Dog> findAllUserDogs(int id);
	public List<Event> findAllUsersEvents(int id);
	
	public User getUserByUsernameAndPassword(String username, String password);
	
	// DO I KEEP THIS SHIT
	public Event createEvent(Event newEvent);
	public Event updateEvent(int id, Event event);
	public boolean deleteEvent(int id);
	public List<Event> findAllCreatedEvents(int id);
	public UserEvent addEventToUserEventList(User user, int id);
	
	// HOW DO I WRITE THIS SHIT FOR EVENTS THE USER WILL ATTEND
}
