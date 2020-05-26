package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.User;


@Service
@Transactional
public class DogDAOImpl implements DogDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Dog createDog(Dog newDog, User user) {
	user.addDog(newDog);
	em.persist(newDog);
	newDog.setUser(user);
	em.flush();
	
	return newDog;
}

@Override
public Dog updateDog(int id, Dog dog) {
	Dog updatedDog = em.find(Dog.class, id);
	
	updatedDog.setName(dog.getName());
	updatedDog.setSize(dog.getSize());
	updatedDog.setDogPicture(dog.getDogPicture());
	updatedDog.setBreed(dog.getBreed());
	return updatedDog;
}

@Override
public boolean deleteDog(int id) {
	em.remove(em.find(Dog.class, id));
	em.flush();
	boolean stillContains = em.contains(em.find(Dog.class, id));
	System.out.println(stillContains);
	return false;
}


@Override
public List<Dog> findAllUserDogs(int id) {
	String jpql = "SELECT d from Dog d where d.user =:id";
	List<Dog> dogs;
	dogs = em.createQuery(jpql, Dog.class).getResultList();
	return dogs;
}

public Dog findDogById(int id) {
	return em.find(Dog.class, id);
}

}
