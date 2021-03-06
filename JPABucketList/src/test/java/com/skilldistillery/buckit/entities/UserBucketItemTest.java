package com.skilldistillery.buckit.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserBucketItemTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserBucketItem userBucketItem;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABucketList");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		userBucketItem = em.find(UserBucketItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		userBucketItem = null;
		em.close();
	}

	@Test
	void test_userBucketItem_mappings() {
		assertNotNull(userBucketItem);
		assertNull(userBucketItem.getDateAdded());
		assertNull(userBucketItem.getDateCompleted());
		assertFalse(userBucketItem.getIsCompleted());
	}
	
	@Test
	void test_userBucketItem_to_user_mappings() {
		assertNotNull(userBucketItem);
		assertEquals("brandon-f", userBucketItem.getUser().getUsername());
	}
	
	@Test
	void test_userBucketItem_to_BucketItem_mappings() {
		assertNotNull(userBucketItem);
		assertEquals("Climb the Eiffel Tower", userBucketItem.getBucketItem().getName());
	}
	
}
