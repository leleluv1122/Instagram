package out.stagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.repository.Post_imageRepository;

@Service
public class Post_imageService {
	@Autowired
	Post_imageRepository piRespository;
}
