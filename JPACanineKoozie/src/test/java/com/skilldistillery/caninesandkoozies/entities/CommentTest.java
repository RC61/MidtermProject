package com.skilldistillery.caninesandkoozies.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Comment comment;

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
		comment = em.find(Comment.class, 3);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}

	@Test
	void test_Comment_entity_mapping() {
		assertNotNull(comment);
		assertEquals(2020, comment.getCommentCreateDate().getYear());
		assertEquals(5, comment.getCommentCreateDate().getMonthValue());
		assertEquals(22, comment.getCommentCreateDate().getDayOfMonth());
		assertEquals(14, comment.getCommentCreateDate().getHour());
		assertEquals(30, comment.getCommentCreateDate().getMinute());
		assertEquals("I'm not going Chad your dog ripped my pants last time", comment.getDescription());
		assertEquals("Toni", comment.getUser().getFname());
		assertEquals("Papp", comment.getUser().getLname());
	}

}
