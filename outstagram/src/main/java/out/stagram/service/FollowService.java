package out.stagram.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Follow;
import out.stagram.repository.FollowRepository;

@Service
public class FollowService {
	@Autowired
	FollowRepository followRepository;
	@Autowired
	UserService userService;
	
	public void save(int login_id, int page_id) {
		Follow f = new Follow();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		f.setFollowing(userService.findById(login_id));
		f.setFollower(userService.findById(page_id));
		f.setFollow_date(timestamp);
		
		followRepository.save(f);
	}
	
	public boolean find(int id, String userId) {
		if(followRepository.countByFollowerIdAndFollowingUserId(id, userId) == 0)
			return false;
		return true;
	}
	
	public void deleteByFollowingIdAndFollowerId(int id1, int id2) {
		followRepository.deleteByFollowingIdAndFollowerId(id2, id1);
	}
	
	public int countByFollowerId(int id) {
		return followRepository.countByFollowerId(id);
	}
	
	public int countByFollowingId(int id) {
		return followRepository.countByFollowingId(id);
	}
	
	public List<Follow> findByFollowingId(int id) {
		return followRepository.findByFollowingId(id);
	}
	
	public List<Follow> findByFollowerId(int id){
		return followRepository.findByFollowerId(id);
	}
}
