package com.skilldistillery.caninesandkoozies.entities;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="user_event")
public class UserEvent {

	@EmbeddedId
	private UserEventId id;
	
	private Integer rating;
	
	

	public UserEvent() {
		super();
	}

	public UserEvent(UserEventId id, Integer rating) {
		super();
		this.id = id;
		this.rating = rating;
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
		return "UserEvent [id=" + id + ", rating=" + rating + "]";
	}
	
	
	
}
