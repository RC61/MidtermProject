package com.skilldistillery.caninesandkoozies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.caninesandkoozies.entities.Comment;
import com.skilldistillery.caninesandkoozies.entities.Event;
import com.skilldistillery.caninesandkoozies.entities.User;

@Service
@Transactional
public class CommentDAOImpl implements CommentDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Comment findCommentById(int id) {
		return em.find(Comment.class, id);
	}
	
	@Override
	public Comment createComment(Comment newComment, User user, Event event) {
		
		event.addComment(newComment);
		
		
		em.persist(newComment);
		
		em.flush();
		em.close();
		
		return newComment;
	}
	
	@Override
	public List<Comment> findAllEventComments(int id){
		List<Comment> comments;
		
		String jpql = "select c from Comment c where c.event = :id ";
		
		comments = em.createQuery(jpql, Comment.class).setParameter("id", id).getResultList();
		
		return comments;
	}
	
	@Override
	public Comment updateComment(Comment comment) {
		Comment updatedComment = em.find(Comment.class, comment.getId());
		
		updatedComment.setCommentCreateDate(comment.getCommentCreateDate());
		updatedComment.setDescription(comment.getDescription());
		updatedComment.setEvent(comment.getEvent());
		updatedComment.setId(comment.getId());
		updatedComment.setUser(comment.getUser());
		
		em.flush();
		em.close();
		
		return updatedComment;
	}
	
	@Override
	public boolean destroyComment(int id) {
		Comment comment = em.find(Comment.class, id);
		
		em.remove(comment);
		
		boolean stillContains = em.contains(comment);
		
		em.flush();
		em.close();
		
		return !stillContains;
	}
	
}
