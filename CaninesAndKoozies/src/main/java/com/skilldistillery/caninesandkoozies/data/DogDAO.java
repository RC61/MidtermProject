package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Dog;
import com.skilldistillery.caninesandkoozies.entities.User;

public interface DogDAO {
	
	public Dog createDog(Dog newDog, User user);
	public Dog updateDog(int id, Dog dog);
	public boolean deleteDog(int id);
	public List<Dog> findAllUserDogs(int id);
	public Dog findDogById(int id);
	
}
