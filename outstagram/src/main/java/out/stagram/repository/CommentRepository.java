package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	List<Comment> findByPostId(int pid);

	int countByPostId(int id);

	@Modifying
	@Transactional
	void deleteById(int id);

	@Modifying
	@Transactional
	void deleteByPostId(int id);
	
	@Modifying
	@Transactional
	void deleteByUserId(int id);
}
