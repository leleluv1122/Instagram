package out.stagram.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import out.stagram.domain.Chat;
import out.stagram.repository.ChatRepository;

@Service
public class ChatService {
	@Autowired
	ChatRepository chatRepository;
	@Autowired
	UserService userService;

	public void save(int r, int s, String c) {
		Chat chat = new Chat();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		chat.setWritetime(timestamp);
		chat.setSend(userService.findById(s));
		chat.setReceive(userService.findById(r));
		chat.setContent(c);

		chatRepository.save(chat);
	}

	public List<Chat> findBySendIdAndReceiveId(int s, int r) {
		return chatRepository.findBySendIdAndReceiveId(s, r);
	}
	
	public void deleteUser(int id) {
		chatRepository.deleteBySendId(id);
		chatRepository.deleteByReceiveId(id);
	}
}
