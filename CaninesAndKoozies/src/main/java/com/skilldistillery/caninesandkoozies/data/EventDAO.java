package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;
import com.skilldistillery.caninesandkoozies.entities.Venue;

public interface EventDAO {
	
	public Event createEvent(Event event, User user, int venueId, String eventDate);
	
	public Event updateEvent(String eventDate, String createDate, Event event, int userCreatedId);

	public boolean destroy(int id);
	
	public List<Event> findAllEvents();
	
	public List<Event> eventsBySinglesOnlyPreference(Boolean singlesOnly);
	
	public List<Event> eventsByDogSizePreference(String dogSizePref);
	
	public List<Event> findEventsByKeyword(String keyword);
	
	public Event findEventById(int id);
}
