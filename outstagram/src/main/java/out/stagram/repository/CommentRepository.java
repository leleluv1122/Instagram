package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import out.stagram.domain.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	List<Comment> findByPostId(int pid);
}
