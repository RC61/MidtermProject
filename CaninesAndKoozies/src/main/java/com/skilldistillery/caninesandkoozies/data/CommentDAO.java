package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Comment;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;

public interface CommentDAO {

	public Comment findCommentById(int id);
	public Comment createComment(String description, int userid, int eventId) ;
	public List<Comment> findAllEventComments(int id);
	public Comment updateComment(Comment comment);
	public boolean destroyComment(int id) ;
}
