package com.skilldistillery.caninesandkoozies.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="event_date_time")
	private LocalDateTime eventDateTime;
	
	@Column(name="dog_size_preference")
	private String dogSizePreference;
	
	@Column(name="single_only_preference")
	private boolean singleOnlyPreference;
	
	@Column(name="picture_url")
	private String pictureURL;
	
	private String description;
	
	@CreationTimestamp
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@UpdateTimestamp
	@Column(name="update_date")
	private LocalDateTime updateDate;

	@OneToMany(mappedBy="event")
	private List<Comment> comments;
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="venue_id")
	private Venue venue;
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="creator_id")
	private User userCreated;
	
	@OneToMany(mappedBy="event")
	private List<UserEvent> userEvents;
	
	public Event() {
		super();
	}

	public Event(int id, String name, LocalDateTime eventDateTime, String dogSizePreference,
			boolean singleOnlyPreference, String pictureURL, String description, LocalDateTime createDate,
			LocalDateTime updateDate, int venueId, int creatorId) {
		super();
		this.id = id;
		this.name = name;
		this.eventDateTime = eventDateTime;
		this.dogSizePreference = dogSizePreference;
		this.singleOnlyPreference = singleOnlyPreference;
		this.pictureURL = pictureURL;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	public void addUserEvent(UserEvent userEvent) {
		if (userEvents == null) {
			userEvents = new ArrayList<>();
		}
		
		if (!userEvents.contains(userEvent)) {
			userEvents.add(userEvent);
			if(userEvent.getEvent() != null) {
				userEvent.getEvent().getUserEvents().remove(userEvent);
			}
			userEvent.setEvent(this);
		}
	}
	
	public void removeUserEvent(UserEvent userEvent) {
		userEvent.setEvent(null);
		if(userEvents != null) {
			userEvents.remove(userEvent);
		}
	}
	
	public void addComment(Comment comment) {
		if(comments == null) {
			comments = new ArrayList<>();
		}
		
		if(!comments.contains(comment)) {
			comments.add(comment);
			if(comment.getEvent() != null) {
				comment.getEvent().getComments().remove(comment);
			}
			comment.setEvent(this);
		}
	}
	
	public void removeComment(Comment comment) {
		comment.setEvent(null);
		if (comments != null) {
			comments.remove(comment);
		}
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public User getUserCreated() {
		return userCreated;
	}

	public void setUserCreated(User userCreated) {
		this.userCreated = userCreated;
	}

	public List<UserEvent> getUserEvents() {
		return userEvents;
	}

	public void setUserEvents(List<UserEvent> userEvents) {
		this.userEvents = userEvents;
	}

	public boolean isSingleOnlyPreference() {
		return singleOnlyPreference;
	}

	public void setSingleOnlyPreference(boolean singleOnlyPreference) {
		this.singleOnlyPreference = singleOnlyPreference;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getEventDateTime() {
		return eventDateTime;
	}

	public void setEventDateTime(LocalDateTime eventDateTime) {
		this.eventDateTime = eventDateTime;
	}

	public String getDogSizePreference() {
		return dogSizePreference;
	}

	public void setDogSizePreference(String dogSizePreference) {
		this.dogSizePreference = dogSizePreference;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", name=" + name + ", eventDateTime=" + eventDateTime + ", dogSizePreference="
				+ dogSizePreference + ", singleOnlyPreference=" + singleOnlyPreference + ", pictureURL=" + pictureURL
				+ ", description=" + description + ", createDate=" + createDate + ", updateDate=" + updateDate
				+ ", userCreated=" + userCreated + "]";
	}
	
	
}
