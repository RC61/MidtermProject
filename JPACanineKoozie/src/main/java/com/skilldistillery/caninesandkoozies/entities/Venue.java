package com.skilldistillery.caninesandkoozies.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Venue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="alcohol_provided")
	private boolean alcoholProvided;
	
	@Column(name="picture_url")
	private String pictureURL;
	
	@Column(name="venue_link")
	private String venueLink;
	
	@OneToMany(mappedBy="venue")
	private List<Event> events;
	
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="address_id")
	private Address address;

	public Venue() {
		super();
	}

	public Venue(int id, String name, boolean alcoholProvided, String pictureURL, String venueLink, int addressId) {
		super();
		this.id = id;
		this.name = name;
		this.alcoholProvided = alcoholProvided;
		this.pictureURL = pictureURL;
		this.venueLink = venueLink;
	}
	
	public void addEvent(Event event) {
		if (events == null) {
			events = new ArrayList<>();
		}
		
		if (!events.contains(event)) {
			events.add(event);
			if (event.getVenue() != null) {
				event.getVenue().getEvents().remove(event);
			}
			event.setVenue(this);
		}
	}
	
	public void removeEvent(Event event) {
		event.setVenue(null);
		if (events != null) {
			events.remove(event);
		}
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
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

	public boolean isAlcoholProvided() {
		return alcoholProvided;
	}

	public void setAlcoholProvided(boolean alcoholProvided) {
		this.alcoholProvided = alcoholProvided;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public String getVenueLink() {
		return venueLink;
	}

	public void setVenueLink(String venueLink) {
		this.venueLink = venueLink;
	}


	@Override
	public String toString() {
		return "Venue [id=" + id + ", name=" + name + ", alcoholProvided=" + alcoholProvided + ", pictureURL="
				+ pictureURL + ", venueLink=" + venueLink +"]";
	}
	
	
}
