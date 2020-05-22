package com.skilldistillery.caninesandkoozies.entities;

import java.sql.Time;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
	
	@Column(name="venue_id")
	private int venueId;
	
	@Column(name="creator_id")
	private int creatorId;

	
	
	
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
		this.venueId = venueId;
		this.creatorId = creatorId;
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

	public int getVenueId() {
		return venueId;
	}

	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", name=" + name + ", eventDateTime=" + eventDateTime + ", dogSizePreference="
				+ dogSizePreference + ", pictureURL=" + pictureURL + ", description=" + description + ", createDate="
				+ createDate + ", updateDate=" + updateDate + ", venueId=" + venueId + ", creatorId=" + creatorId + "]";
	}
	
	
}
