package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.Follow;

public interface FollowRepository extends JpaRepository<Follow, Integer> {
	int countByFollowerIdAndFollowingUserId(int id, String userId);

	@Modifying
	@Transactional
	void deleteByFollowingIdAndFollowerId(int id1, int id2);
	
	int countByFollowerId(int id);
	int countByFollowingId(int id);
	
	List<Follow> findByFollowingId(int id);
	List<Follow> findByFollowerId(int id);
}