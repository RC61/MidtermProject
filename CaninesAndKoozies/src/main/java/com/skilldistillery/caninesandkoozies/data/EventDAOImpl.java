package com.skilldistillery.caninesandkoozies.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;
import com.skilldistillery.caninesandkoozies.entities.UserEvent;
import com.skilldistillery.caninesandkoozies.entities.UserEventId;
import com.skilldistillery.caninesandkoozies.entities.Venue;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Event createEvent(Event event, User user, int venueId, String eventDate) {
		LocalDateTime timey = LocalDateTime.parse(eventDate);
		Venue venue = em.find(Venue.class, venueId);
		user = em.find(User.class, user.getId());
		System.out.println(user);
		if (venue != null && user != null) {
			System.out.println(user);
			event.setVenue(venue);
			event.setEventDateTime(timey);
			event.setUserCreated(user);
			System.out.println(event);
			em.persist(event);
			System.out.println(event);
		}
		em.flush();

		return event;
	}

	public List<Event> findAllEvents() {
		String jpql = "SELECT e FROM Event e";
		List<Event> events;
		events = em.createQuery(jpql, Event.class).getResultList();

		em.close();
		return events;
	}

	public List<Event> eventsBySinglesOnlyPreference(Boolean singlesOnly) {
		List<Event> events;
		String jpql = "SELECT e FROM Event e WHERE e.singleOnlyPreference = :true";
		events = em.createQuery(jpql, Event.class).setParameter("true", singlesOnly).getResultList();

		return events;
	}

	public List<Event> eventsByDogSizePreference(String dogSizePref) {
		List<Event> events;
		String jpql = "SELECT e FROM Event e WHERE e.dog_size_preference = :dogSize";
		events = em.createQuery(jpql, Event.class).setParameter("dogSize", dogSizePref).getResultList();

		return events;
	}

	public Event updateEvent(Event event) {

		Event updatedEvent = em.find(Event.class, event.getId());
		updatedEvent.setName(event.getName());
		updatedEvent.setEventDateTime(event.getEventDateTime());
		updatedEvent.setDogSizePreference(event.getDogSizePreference());
		updatedEvent.setSingleOnlyPreference(event.isSingleOnlyPreference());
		updatedEvent.setPictureURL(event.getPictureURL());
		updatedEvent.setDescription(event.getDescription());
		updatedEvent.setCreateDate(event.getCreateDate());
		updatedEvent.setUpdateDate(event.getUpdateDate());
		updatedEvent.setComments(event.getComments());
		updatedEvent.setVenue(event.getVenue());
		updatedEvent.setUserCreated(event.getUserCreated());
		updatedEvent.setUserEvents(event.getUserEvents());

		em.flush();
		em.close();

		return updatedEvent;
	}

	public boolean destroy(int id) {
		Event event = em.find(Event.class, id);

		em.remove(event);

		boolean stillContains = em.contains(event);

		em.flush();
		em.close();

		return !stillContains;
	}

	public Event findEventById(int id) {
		return em.find(Event.class, id);
	}

	@Override
	public List<Event> findEventsByKeyword(String keyword) {
		List<Event> resultPool = null;
		String jpql = "Select search from Event search where search.venue.name like :key or search.name like :key or search.eventDateTime like :key or search.userCreated like :key";
		resultPool = em.createQuery(jpql, Event.class).setParameter("key", keyword).getResultList();
		return resultPool;
	}

}
