package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import com.skilldistillery.caninesandkoozies.entities.Comment;

public interface CommentDAO {

	public Comment findCommentById(int id);
	public List<Comment> findAllEventComments(int id);
	public Comment updateComment(Comment comment);
	public boolean destroyComment(int id) ;
}
