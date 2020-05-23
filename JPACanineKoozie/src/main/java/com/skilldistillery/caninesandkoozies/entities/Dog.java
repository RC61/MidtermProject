package com.skilldistillery.caninesandkoozies.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Dog {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String breed;
	private String size;
	
	@Column (name= "picture_url")
	private String dogPicture;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	public Dog() {
		super();
	}


	public Dog(int id, String name, String breed, String size, String dogPicture, User user) {
		super();
		this.id = id;
		this.name = name;
		this.breed = breed;
		this.size = size;
		this.dogPicture = dogPicture;
		this.user = user;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getDogPicture() {
		return dogPicture;
	}

	public void setDogPicture(String dogPicture) {
		this.dogPicture = dogPicture;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Dog [id=" + id + ", name=" + name + ", breed=" + breed + ", size=" + size + ", dogPicture=" + dogPicture
				+ ", user=" + user + "]";
	}
	
	

}
