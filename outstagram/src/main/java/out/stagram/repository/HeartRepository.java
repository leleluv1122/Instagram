package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.Heart;

public interface HeartRepository extends JpaRepository<Heart, Integer> {
	int countByPostIdAndUserId(int pid, int uid);
	
	@Modifying
	@Transactional
	void deleteByPostIdAndUserId(int pid, int uid);
	
	List<Heart> findByPostId(int id);
	int countByPostId(int id);
}
