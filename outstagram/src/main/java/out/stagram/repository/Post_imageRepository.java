package out.stagram.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import out.stagram.domain.Post_image;

public interface Post_imageRepository extends JpaRepository<Post_image, Integer> {
	
}
