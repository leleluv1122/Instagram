package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.Chat;

public interface ChatRepository extends JpaRepository<Chat, Integer> {
	List<Chat> findBySendIdAndReceiveId(int s, int r);
	
	@Modifying
	@Transactional
	void deleteBySendId(int id);
	
	@Modifying
	@Transactional
	void deleteByReceiveId(int id);
}
