package out.stagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Post_image;
import out.stagram.repository.Post_imageRepository;

@Service
public class Post_imageService {
	@Autowired
	Post_imageRepository piRepository;

	public void save(Post_image pi) {
		Post_image p = new Post_image();
		p.setFilename(pi.getFilename());
		p.setFileOriname(pi.getFileOriname());
		p.setPostId(pi.getPostId());

		piRepository.save(p);
	}

	public List<Post_image> findAll() {
		return piRepository.findAll();
	}

	public List<Post_image> findByGroupbyPostId() {
		return piRepository.findByGroupbyPostId();
	}
	
	public List<Post_image> findBypostId(int id){
		return piRepository.findBypostId(id);
	}
}
