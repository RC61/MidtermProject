package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Venue;

@Service
@Transactional
public class VenueDAOImpl implements VenueDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Venue findVenueById(int id) {
		return em.find(Venue.class, id);
	}
	
	@Override
	public List<Venue> findAllVenues(){
		String jpql = "select v from Venue v";
		List<Venue> venues = em.createQuery(jpql, Venue.class).getResultList();
		em.close();
		return venues;
	}
}
