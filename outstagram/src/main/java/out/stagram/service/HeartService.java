package out.stagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Heart;
import out.stagram.domain.Post;
import out.stagram.domain.User;
import out.stagram.repository.HeartRepository;

@Service
public class HeartService {
	@Autowired
	HeartRepository heartRepository;
	
	public void save(Post p, User u) {
		Heart h = new Heart();
		h.setPost(p);
		h.setUser(u);
		
		heartRepository.save(h);
	}
	
	public int countByPostIdAndUserId(int pid, int uid) {
		return heartRepository.countByPostIdAndUserId(pid, uid);
	}
	
	public void deleteByPostIdAndUserId(int pid, int uid) {
		heartRepository.deleteByPostIdAndUserId(pid, uid);
	}
}
