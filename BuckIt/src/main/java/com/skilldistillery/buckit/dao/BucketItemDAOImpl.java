package com.skilldistillery.buckit.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.buckit.entities.BucketItem;

@Service
@Transactional
public class BucketItemDAOImpl implements BucketItemDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public BucketItem createBucketItem(BucketItem bucketItem) {
		em.persist(bucketItem);
		return bucketItem;
	}

	@Override
	public BucketItem updateBucketItem(BucketItem bucketItem) {
		BucketItem bucketItemDB = em.find(BucketItem.class, bucketItem.getId());

		bucketItemDB.setName(bucketItem.getName());
		bucketItemDB.setDescription(bucketItem.getDescription());
		bucketItemDB.setDateCreated(bucketItem.getDateCreated());
		bucketItemDB.setDateUpdated(bucketItem.getDateUpdated());
		bucketItemDB.setIsPublicAtCreation(bucketItem.getIsPublicAtCreation());
		bucketItemDB.setIsActive(bucketItem.getIsActive());
		bucketItemDB.setImageUrl(bucketItem.getImageUrl());
		bucketItemDB.setLocation(bucketItem.getLocation());
		bucketItemDB.setCreatedByUser(bucketItem.getCreatedByUser());
		bucketItemDB.setCategories(bucketItem.getCategories());
		bucketItemDB.setPolls(bucketItem.getPolls());
		bucketItemDB.setComments(bucketItem.getComments());

		em.flush();

		return bucketItemDB;
	}

	@Override
	public boolean deleteBucketItem(int id) {
		boolean deleted = false;

		BucketItem itemTBD = em.find(BucketItem.class, id);
		if (itemTBD != null) {
			em.remove(itemTBD);
			deleted = !em.contains(itemTBD);
		}

		return deleted;
	}

}