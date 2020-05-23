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

public class EventTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		event = null;
	}

	@Test
	void test_Event_entity_mapping() {
		assertNotNull(event);
		assertEquals(1, event.getId());
		assertEquals("Wine and Pup", event.getName());
		assertEquals(2020, event.getEventDateTime().getYear());
		assertEquals("small", event.getDogSizePreference());
		assertTrue(event.isSingleOnlyPreference());
		assertEquals(null, event.getPictureURL());
		assertEquals("Drink wine and bring pups", event.getDescription());
		assertEquals(2020, event.getCreateDate().getYear());
		assertEquals(null, event.getUpdateDate());
	}
	
	@Test
	void test_Event_relationship_mapping() {
		assertNotNull(event);
		assertEquals("can't wait!", event.getComments().get(0).getDescription());
		assertEquals("admin", event.getUserEvents().get(0).getUser().getFname());
		assertEquals("Sample Venue", event.getVenue().getName());
		assertEquals("Tabatha", event.getUserCreated().getFname());
	}
}
