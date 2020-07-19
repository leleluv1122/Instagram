package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.Post_image;

public interface Post_imageRepository extends JpaRepository<Post_image, Integer> {
	@Query(nativeQuery = true, value = "select * from Post_image p GROUP BY postid")
	List<Post_image> findByGroupbyPostId();
	
	List<Post_image> findBypostId(int id);
	
	@Modifying
	@Transactional
	void deleteByPostId(int id);
}
