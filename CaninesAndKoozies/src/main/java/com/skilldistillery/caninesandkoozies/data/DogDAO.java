package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Dog;

public interface DogDAO {
	
	public Dog createDog(Dog newDog);
	public Dog updateDog(int id, Dog dog);
	public boolean deleteDog(int id);
	public List<Dog> findAllUserDogs(int id);
	
}
