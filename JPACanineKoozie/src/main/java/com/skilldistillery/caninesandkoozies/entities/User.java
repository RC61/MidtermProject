package com.skilldistillery.caninesandkoozies.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private Boolean enabled;
	private String role;
	
	@Column(name= "first_name")
	private String fname;
	
	@Column(name= "last_name")
	private String lname;
	
	@Column(name= "birth_date")
	private LocalDate birthDate;
	
	@Column(name= "relationship_status")
	private String relationshipStatus;
	
	private String email;
	
	@Column(name= "alcohol_preference")
	private String alcoholPreference;
	
	@Column(name= "picture_url")
	private String userPicture;
	
	
	@CreationTimestamp
	@Column(name= "create_date")
	private LocalDateTime createDate;
	
	@UpdateTimestamp
	@Column(name= "update_date")
	private LocalDateTime updateDate;


	@OneToOne
    @JoinColumn(name = "address_id")
    private Address address;
	
	@OneToMany(mappedBy= "user")
	private List<Dog> dogs;
	
	@OneToMany(mappedBy = "userCreated", fetch = FetchType.EAGER)
	private List<Event> events;
	
	@OneToMany(mappedBy="user")
	private List<UserEvent> userEvents;
	

	@OneToMany(mappedBy = "user")
	private List<Comment> comments;
	
	
	public User() {
		super();
	}
	
	

	public User(int id, String username, String password, Boolean enabled, String role, String fname, String lname,
			LocalDate birthDate, String relationshipStatus, String email, String alcoholPreference, String userPicture,
			LocalDateTime createDate, LocalDateTime updateDate, Address address) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
		this.fname = fname;
		this.lname = lname;
		this.birthDate = birthDate;
		this.relationshipStatus = relationshipStatus;
		this.email = email;
		this.alcoholPreference = alcoholPreference;
		this.userPicture = userPicture;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.address = address;
	}
	
	
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public String getRelationshipStatus() {
		return relationshipStatus;
	}

	public void setRelationshipStatus(String relationshipStatus) {
		this.relationshipStatus = relationshipStatus;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAlcoholPreference() {
		return alcoholPreference;
	}

	public void setAlcoholPreference(String alcoholPreference) {
		this.alcoholPreference = alcoholPreference;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}


	public List<Dog> getDogs() {
		return dogs;
	}



	public void setDogs(List<Dog> dogs) {
		this.dogs = dogs;
	}
	
	
	
	public List<Comment> getComments() {
		return comments;
	}



	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}



	public void addDog(Dog dog) {
		if (dogs == null) {
			dogs = new ArrayList<>(); }
		if (!dogs.contains(dog)); {
			dogs.add(dog);
			if (dog.getUser() != null) {
				dog.getUser().getDogs().remove(dog);
			}
			dog.setUser(this);
		}
	}
	
	public void removeDog(Dog dog) {
		dog.setUser(null);
		if (dogs != null) {
			dogs.remove(dog);
		}
	}
	

	



	public List<Event> getEvents() {
		return events;
	}



	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	// EVENT USER IS CREATING
	public void addEvent(Event event) {
		if (events == null) {
			events = new ArrayList<>(); }
		if (!events.contains(event)); {
			events.add(event);
			if (event.getUserCreated() != null) {
				event.getUserCreated().getEvents().remove(event);
			}
		}
	}
	
	public void removeEvent(Event event) {
		event.setUserCreated(null);
		if (events != null) {
			events.remove(event);
		}
	}
	
	

	public List<UserEvent> getUserEvents() {
		return userEvents;
	}



	public void setUserEvents(List<UserEvent> userEvents) {
		this.userEvents = userEvents;
	}
	
	// EVENT USER IS ATTENDING
	public void addUserEvent(UserEvent userEvent) {
		if (userEvents == null) {
			userEvents = new ArrayList<>(); }
		if (!userEvents.contains(userEvent)); {
			userEvents.add(userEvent);
			if (userEvent.getUser() != null) {
				userEvent.getUser().getUserEvents().remove(userEvent);
			}
		}
	}
	
	public void removeUserEvent(UserEvent userEvent) {
		userEvent.setUser(null);
		if (userEvents != null) {
			userEvents.remove(userEvent);
		}
	}
	
	
	public void addComment(Comment comment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		
		if (!comments.contains(comment)) {
			comments.add(comment);
			if(comment.getUser() != null) {
				comment.getUser().getComments().remove(comment);
			}
			comment.setUser(this);
		}
	}

	public void removeComment(Comment comment) {
		comment.setUser(null);
		if (comments != null) {
			comments.remove(comment);
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", fname=" + fname + ", lname=" + lname + ", birthDate=" + birthDate
				+ ", relationshipStatus=" + relationshipStatus + ", email=" + email + ", alcoholPreference="
				+ alcoholPreference + ", userPicture=" + userPicture + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", address=" + address + "]";
	}
	
	
}
