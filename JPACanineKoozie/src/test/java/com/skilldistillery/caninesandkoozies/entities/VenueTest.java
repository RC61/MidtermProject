package com.skilldistillery.caninesandkoozies.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class VenueTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Venue venue;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("CanineKoozie");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		venue = em.find(Venue.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		venue = null;
	}

	@Test
	void test_Venue_entity_mapping() {
		assertNotNull(venue);
		assertEquals(1, venue.getId());
		assertEquals("Sample Venue", venue.getName());
		assertTrue(venue.isAlcoholProvided());
		assertEquals(null, venue.getPictureURL());
		assertEquals(null, venue.getVenueLink());
	}
	
	@Test
	void test_relationship_mapping() {
		assertNotNull(venue);
		assertEquals("678 Venue Lane", venue.getAddress().getStreet());
		assertEquals("Wine and Pup", venue.getEvents().get(0).getName());
	}

}
