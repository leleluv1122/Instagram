package out.stagram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Follow_request;
import out.stagram.domain.User;
import out.stagram.repository.Follow_requestRepository;

@Service
public class Follow_requestService {
	@Autowired
	Follow_requestRepository follow_requestRepository;
	@Autowired
	UserService userService;

	public int request_save(int requestid, int receiveid) {
		Follow_request fr = new Follow_request();
		User requestuser = userService.findById(requestid);
		User receiveuser = userService.findById(receiveid);

		fr.setReceive(receiveuser);
		fr.setRequest(requestuser);

		follow_requestRepository.save(fr);
		return 1;
	}

	public boolean request(int requstid, int receiveid) {
		if(follow_requestRepository.countByRequestIdAndReceiveId(requstid, receiveid) == 1)
			return true;
		else
			return false;
	}
	
	public int countByReceiveId(int id) {
		return follow_requestRepository.countByReceiveId(id);
	}
	
	public List<Follow_request> findByReceiveId(int id){
		return follow_requestRepository.findByReceiveId(id);
	}
	
	public void deleteByRequestIdAndReceiveId(int id1, int id2) {
		follow_requestRepository.deleteByRequestIdAndReceiveId(id1, id2);
	}
}
