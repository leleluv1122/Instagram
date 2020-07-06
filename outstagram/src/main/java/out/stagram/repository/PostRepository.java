package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import out.stagram.domain.Post;

public interface PostRepository extends JpaRepository<Post, Integer> {
	List<Post> findByUserIdOrderByIdDesc(int id);
}