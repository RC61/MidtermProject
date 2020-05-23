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
	public User updateUser(int id, User user) {
		
		User updatedUser = em.find(User.class, id);
		
		updatedUser.setFname(user.getFname());
		updatedUser.setLname(user.getLname());
		updatedUser.setAddress(user.getAddress());
		updatedUser.setAlcoholPreference(user.getAlcoholPreference());
		updatedUser.setEmail(user.getEmail());
		return updatedUser;
	}
	
	@Override
	public boolean deleteUser(int id) {
		em.remove(em.find(User.class, id));
		em.flush();
		boolean stillContains = em.contains(em.find(User.class, id));
		System.out.println(stillContains);
		return !stillContains;
	}

	@Override
	public Dog createDog(Dog newDog) {
		em.persist(newDog);
		em.flush();
		return newDog;
	}
	
	@Override
	public Dog updateDog(int id, Dog dog) {
		Dog updatedDog = em.find(Dog.class, id);
		
		updatedDog.setName(dog.getName());
		updatedDog.setSize(dog.getSize());
		updatedDog.setDogPicture(dog.getDogPicture());
		return updatedDog;
	}
	
	@Override
	public boolean deleteDog(int id) {
		em.remove(em.find(Dog.class, id));
		em.flush();
		boolean stillContains = em.contains(em.find(Dog.class, id));
		System.out.println(stillContains);
		return false;
	}
	
	// COME BACK TO FINISH ME
	@Override
	public List<Dog> findAllUserDogs() {
//		String jpql = "SELECT "
		return null;
	}

	
	@Override
	public Event createEvent(Event newEvent) {
		em.persist(newEvent);
		em.flush();
		return newEvent;
	}

	// FINISH ME
	@Override
	public Event updateEvent(int id, Event event) {
		Event updatedEvent = em.find(Event.class, id);
		return null;
	}

	@Override
	public boolean deleteEvent(int id) {
		em.remove(em.find(Event.class, id));
		em.flush();
		boolean stillContains = em.contains(em.find(Event.class, id));
		System.out.println(stillContains);
		return !stillContains;
	}

	//FINISH ME
	@Override
	public List<Event> findAllCreatedEvents() {
		// TODO Auto-generated method stub
		return null;
	}

}
