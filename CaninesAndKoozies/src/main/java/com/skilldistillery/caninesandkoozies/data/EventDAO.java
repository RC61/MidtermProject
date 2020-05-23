package com.skilldistillery.caninesandkoozies.data;

import com.skilldistillery.caninesandkoozies.entities.Event;

public interface EventDAO {
	
	public Event createEvent(Event event);
	
	public Event updateEvent(Event event);

}
