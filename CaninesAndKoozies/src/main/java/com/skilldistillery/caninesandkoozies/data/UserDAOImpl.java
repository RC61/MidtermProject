package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;




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
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setUserPicture(user.getUserPicture());
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
		updatedDog.setBreed(dog.getBreed());
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
	

	@Override
	public List<Dog> findAllUserDogs(int id) {
		String jpql = "SELECT d from Dog d where d.user =:id";
		List<Dog> dogs;
		dogs = em.createQuery(jpql, Dog.class).getResultList();
		return dogs;
	}


	@Override
	public Event createEvent(Event newEvent) {
		em.persist(newEvent);
		em.flush();
		return newEvent;
	}

	@Override
	public Event updateEvent(int id, Event event) {
		Event updatedEvent = em.find(Event.class, id);
		
		updatedEvent.setDescription(event.getDescription());
		updatedEvent.setVenue(event.getVenue());
		updatedEvent.setEventDateTime(event.getEventDateTime());
		updatedEvent.setDogSizePreference(event.getDogSizePreference());
		updatedEvent.setName(event.getName());
		updatedEvent.setPictureURL(event.getPictureURL());
		updatedEvent.setSingleOnlyPreference(event.isSingleOnlyPreference());
		
		return updatedEvent;
	}

	@Override
	public List<Event> findAllCreatedEvents(int id) {
		String jpql = "SELECT e from Event e where e.userCreated =:id";
		List<Event> events;
		events = em.createQuery(jpql, Event.class).getResultList();
		return events;
	}

	@Override
	public boolean deleteEvent(int id) {
		em.remove(em.find(Event.class, id));
		em.flush();
		boolean stillContains = em.contains(em.find(Event.class, id));
		System.out.println(stillContains);
		return !stillContains;
}

	@Override
	public User getUserByUsernameAndPassword(String username, String password) {
		String jpql = "SELECT u from User u WHERE u.username =:un and u.password =:p";
		User user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("p", password).getSingleResult();
		return user;
	}

	@Override
	public User findUserById(int id){
		return em.find(User.class, id);
		}
}

