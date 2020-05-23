package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Event;

public interface EventDAO {
	
	public Event createEvent(Event event);
	
	public Event updateEvent(Event event);

	public boolean destroy(int id);
	
	public List<Event> findAllEvents();
	
	public List<Event> eventsBySinglesOnlyPreference(Boolean singlesOnly);
	
	public List<Event> eventsByDogSizePreference(String dogSizePref);
}
