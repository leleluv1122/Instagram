package out.stagram.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import out.stagram.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	User findOneByUserId(String userId);
	User findById(int id);
	User findByUserId(String userId);
	
}
