package com.skilldistillery.caninesandkoozies.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="create_date")
	private LocalDateTime commentCreateDate;
	private String description;
	@ManyToOne
	@JoinColumn(name="event_id")
	private Event event;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	public Comment() {}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public LocalDateTime getCommentCreateDate() {
		return commentCreateDate;
	}
	
	public void setCommentCreateDate(LocalDateTime commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", commentCreateDate=" + commentCreateDate + ", description=" + description
				+ ", event=" + event + ", user=" + user + "]";
	}
	
	
}
