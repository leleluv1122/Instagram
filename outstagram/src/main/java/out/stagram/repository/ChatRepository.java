package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import out.stagram.domain.Chat;

public interface ChatRepository extends JpaRepository<Chat, Integer> {
	List<Chat> findBySendIdAndReceiveId(int s, int r);
}
