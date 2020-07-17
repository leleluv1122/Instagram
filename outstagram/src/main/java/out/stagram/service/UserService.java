package out.stagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import out.stagram.domain.User;
import out.stagram.model.UserRegistrationModel;
import out.stagram.repository.UserRepository;
import out.stagram.utils.EncryptionUtils;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;

	public User login(String userId, String password) {
		User user = userRepository.findOneByUserId(userId);
		if (user == null)
			return null;
		String pw = EncryptionUtils.encryptMD5(password);

		if (user.getPassword().equals(pw) == false)
			return null;
		return user;
	}

	public User findByUserId(String userId) {
		return userRepository.findByUserId(userId);
	}

	public User findById(int id) {
		return userRepository.findById(id);
	}

	public boolean hasErrors(UserRegistrationModel userModel, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		/*
		 * if (userModel.getPasswd1().equals(userModel.getPasswd2()) == false) {
		 * bindingResult.rejectValue("passwd2", null, "비밀번호가 일치하지 않습니다."); return true;
		 * }
		 */
		User user = userRepository.findOneByUserId(userModel.getUserid());
		if (user != null) {
			bindingResult.rejectValue("userid", null, "사용자 아이디가 중복됩니다.");
			return true;
		}
		return false;
	}

	public User createEntity(UserRegistrationModel userModel) {
		User user = new User();
		String pw = EncryptionUtils.encryptMD5(userModel.getPasswd1());
		user.setUserId(userModel.getUserid());
		user.setPassword(pw);
		user.setName(userModel.getName());
		user.setPhone(userModel.getPhone());
		user.setEnable(1);
		user.setUserType("user");

		return user;
	}

	public void save(UserRegistrationModel userModel) {
		User user = createEntity(userModel);
		save_u(user);
	}

	public void img_update(String userId, String profile_photo) {
		User user = findByUserId(userId);
		user.setProfile_photo(profile_photo);

		save_u(user);
	}

	public void profile_update(String userId, String name, String website, String introduce) {
		User user = findByUserId(userId);
		user.setName(name);
		user.setWebsite(website);
		user.setIntroduce(introduce);

		save_u(user);
	}

	public void save_u(User user) {
		userRepository.save(user);
	}

	public List<User> findByUserIdContains(String word) {
		return userRepository.findByUserIdContains(word);
	}

	public int countByUserIdContains(String word) {
		return userRepository.countByUserIdContains(word);
	}

	public boolean user_exist(String userid, String phone) {
		if (userRepository.countByUserIdAndPhone(userid, phone) != 0)
			return true;
		return false;
	}
	
	public void pswd_update(String pswd, String userid) {
		User user = findByUserId(userid);
		String pw = EncryptionUtils.encryptMD5(pswd);
		user.setPassword(pw);
		
		save_u(user);
	}
}
