package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Venue;

public interface VenueDAO {

	public List<Venue> findAllVenues();
	public Venue findVenueById(int id);
}
