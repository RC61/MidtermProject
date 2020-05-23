package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.User;

import antlr.debug.Event;


@Service
@Transactional
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User newUser) {
		em.persist(newUser);
		em.flush();
		return newUser;
	}

	@Override
	public Dog createDog(Dog newDog) {
		em.persist(newDog);
		em.flush();
		return newDog;
	}

	@Override
	public Event createEvent(Event newEvent) {
		em.persist(newEvent);
		em.flush();
		return newEvent;
	}

	@Override
	public User updateUser(int id, User user) {
		
		User updatedUser = em.find(User.class, id);
		
		updatedUser.setFname(user.getFname());
		return null;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Dog updateDog(int id, Dog dog) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteDog(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Dog> findAllUserDogs() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event updateEvent(int id, Event event) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteEvent(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Event> findAllCreatedEvents() {
		// TODO Auto-generated method stub
		return null;
	}

}
