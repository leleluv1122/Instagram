package out.stagram.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import out.stagram.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	User findOneByUserId(String userId);

	User findById(int id);

	User findByUserId(String userId);

	List<User> findByUserIdContains(String word);
	int countByUserIdContains(String word);
	
	int countByUserIdAndPhone(String userid, String phone);
	
	int countByIdAndPassword(int uid, String pswd);
	
	@Modifying
	@Transactional
	void deleteById(int id);
}
