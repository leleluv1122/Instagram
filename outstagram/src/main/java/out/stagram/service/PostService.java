package out.stagram.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Post;
import out.stagram.repository.PostRepository;

@Service
public class PostService {
	@Autowired
	PostRepository postRepository;
	
	public int save(Post p) {
		Post pi = new Post();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		pi.setUser(p.getUser());
		pi.setDescription(p.getDescription());
		pi.setLocation(p.getLocation());
		pi.setCreate_date(timestamp);
		
		postRepository.save(pi);
		
		return pi.getId();
	}
	
	public void findById(int id) {
		postRepository.findById(id);
	}
	
	public void flush() {
		postRepository.flush();
	}
	
	public List<Post> findByUserIdOrderByIdDesc(int id){
		return postRepository.findByUserIdOrderByIdDesc(id);
	}
}
