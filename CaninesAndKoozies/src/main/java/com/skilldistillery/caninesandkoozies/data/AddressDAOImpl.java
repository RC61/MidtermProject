package com.skilldistillery.caninesandkoozies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Address;

@Service
@Transactional
public class AddressDAOImpl {
	
	@PersistenceContext
	private EntityManager em;
	

	public Address createAddress(Address address) {
		em.persist(address);
		em.flush();
		return address;
	}

}
