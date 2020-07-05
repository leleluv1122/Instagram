package out.stagram.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Post;
import out.stagram.repository.PostRepository;

@Service
public class PostService {
	@Autowired
	PostRepository postRepository;
	
	public void save() {
		Post pi = new Post();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		///////////////////////////
		//////////추가하기////////////
		///////////////////////////
		
		pi.setCreate_date(timestamp);
		
		postRepository.save(pi);
	}
}
