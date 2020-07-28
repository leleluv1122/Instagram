package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.Follow_request;

public interface Follow_requestRepository extends JpaRepository<Follow_request, Integer> {
	int countByRequestIdAndReceiveId(int id1, int id2);
	
	int countByReceiveId(int id);
	
	List<Follow_request> findByReceiveId(int id);

	@Modifying
	@Transactional
	void deleteByRequestIdAndReceiveId(int id1, int id2);
}