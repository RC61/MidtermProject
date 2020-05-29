## Mid-Term Project

### Week 10 Team Project for Skill Distillery

#### Team: Wicked Puppet

* Rory Coleman (Developer, Repo Owner)
* Tabatha Flores (Developer, DBA)
* Toni Papp (Developer, Scrum Master)

### Overview

* This application allows users to create and attend events centered around enjoying drinks and playing with dogs.

* When the homepage is displayed, a guest can browse existing events, log in, or register for the website. A logged in user can create events, sign up to go to another user's event, register their dogs, comment on events, update their profile and events, and delete their profile.

* When a user uses the search function, a list of events and users that matched the keyword are returned. The user is then able to view further details from the search results.

* When browsing events, the user is able to look at all events or filter by events that are for singles only. They are able to click on the event to view further details.

* When a user views event details, they are also able to view venue details or comment on the event if they are logged in.

* When a user views their own profile, they are able to update their profile, that of their dogs', view events they've created, and view events they've signed up to attend.

* When a user views the profile of another user, they are able to see details about the user, their dogs, and the events they're going to.

### Implementation

The overall project is mapped out by seven tables in our database. There are entities for the users, dogs, comments, events, address, and venue. In addition, there is a user_event join table. The purpose of this table is to link the user to the events they're attending and vice-versa and stands in contrast to the direct link between user and event which represents the event a user has created.

### Technologies Used

* MySQL
* MySQL Workbench
* MAMP
* JPA
* JUnit
* Spring MVC
* AWS
* CSS
* Bootstrap
* Trello
* Figma
* Slack
* Zoom

### Development Process

As this project was conducted during May of 2020, our whole team was under quarantine due to the coronavirus pandemic. Since we were not able to collaborate in person, planning out everything well in advance was vital to our success. We took a few days to plan out our database schema, the wireframe of our website, and tasks on Trello so that our team was thoroughly on the same page.

It was important for us as a team to work together and help each other as needed.  We had Scrum meetings every morning so that we could check in with each other and be on the same page. For the better part of our days, we stayed in a Zoom meeting so that we were available to each other to coordinate, ask questions, or pair program. We also sent questions, ideas, and resources over Slack.

### Lessons Learned

This project further cemented create, update, and delete functions between a user and the database. It was an exercise for JPA, DAO, controller, and JSP implementation. This was also the first time we were tasked with creating a database with multiple tables and determining the relationships therein. As such, we were also able to learn more about entities and relationship mapping between them. The relationship mapping also heavily affected the CRUD operations and forced us to learn a kind of sequence of how to create entities that have other entities, (such as having to set venues to events as events are created), or having to delete child entities before actually removing the parent entity. Overall, this was a great learning experience for our whole team.

From the overall experience, some team take-aways were:

* Communicate well and communicate often so that everyone is on the same page
* Never wait too long to ask for help
* Do not get stressed out - everything has a solution
* Establish a uniform standard operating procedure in regards to naming and code placement

### Stretch Goals

* Implementation of vendor entity that can accept invitations to events
* Implementation of admin privileges that can approve or deny events
* Ratings tied to events that are displayed with a modern "star" rating
* Embedded Google Maps feature on venue details page
