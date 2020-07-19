package out.stagram.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Comment;
import out.stagram.repository.CommentRepository;

@Service
public class CommentService {
	@Autowired
	CommentRepository commentRepository;
	@Autowired
	PostService postService;
	@Autowired
	UserService userService;
	
	public void save(int pid, int uid, String s) {
		Comment c = new Comment();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		c.setContent(s);
		c.setWritetime(timestamp);
		c.setPost(postService.findById(pid));
		c.setUser(userService.findById(uid));
		
		commentRepository.save(c);
	}

	public List<Comment> findByPostId(int pid){
		return commentRepository.findByPostId(pid);
	}
	
	public int deleteById(int id) {
		commentRepository.deleteById(id);
		return 1;
	}
	
	public int countByPostId(int id) {
		return commentRepository.countByPostId(id);
	}
	
	public void deleteByPostId(int id) {
		commentRepository.deleteByPostId(id);
	}
}
