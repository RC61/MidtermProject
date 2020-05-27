package com.skilldistillery.caninesandkoozies.entities;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="user_event")
public class UserEvent {

	@EmbeddedId
	private UserEventId id;
	
	private Integer rating;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="event_id")
	@MapsId(value="eventId")
	private Event event;

	public UserEvent() {
		super();
	}

	public UserEvent(UserEventId id, Integer rating) {
		super();
		this.id = id;
		this.rating = rating;
	}

	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public UserEventId getId() {
		return id;
	}

	public void setId(UserEventId id) {
		this.id = id;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "UserEvent [id=" + id + ", rating=" + rating + " " +user.getUsername()+ "]";
	}
	
	
	
	
}
