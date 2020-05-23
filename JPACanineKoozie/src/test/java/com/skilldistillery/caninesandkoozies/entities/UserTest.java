package com.skilldistillery.caninesandkoozies.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("tabathaf", user.getUsername());
		assertEquals("tabathaf", user.getPassword());
		assertEquals("Denver", user.getAddress().getCity());
		assertEquals("Baxter", user.getDogs().get(0).getName());
		assertEquals(2020, user.getUserEvents().get(0).getEvent().getEventDateTime().getYear());
		assertEquals(7, user.getUserEvents().get(0).getEvent().getEventDateTime().getMonthValue());
		assertEquals(1, user.getUserEvents().get(0).getEvent().getEventDateTime().getDayOfMonth());
		assertEquals(17, user.getUserEvents().get(0).getEvent().getEventDateTime().getHour());
		assertTrue(user.getEnabled());
	}

}
