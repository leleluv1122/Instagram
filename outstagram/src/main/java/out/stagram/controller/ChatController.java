package out.stagram.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import out.stagram.domain.Chat;
import out.stagram.domain.User;
import out.stagram.service.ChatService;
import out.stagram.service.UserService;

@Controller
public class ChatController {
	@Autowired
	ChatService chatService;
	@Autowired
	UserService userService;

	@MessageMapping("/chat.sendMessage")
	@SendTo("/topic/public")
	public Chat sendMessage(@Payload Chat chat) {
		return chat;
	}

	@MessageMapping("/chat.addUser")
	@SendTo("/topic/public")
	public Chat addUser(@Payload Chat chat, SimpMessageHeaderAccessor headerAccessor) {
		headerAccessor.getSessionAttributes().put("username", chat.getSend().getName());
		return chat;
	}

	@RequestMapping("/main/user/message/{id}")
	public String message(@PathVariable("id") int id, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User login_user = userService.findByUserId(userId);
		model.addAttribute("page_id", id);
		
		List<Chat> chatting = chatService.findBySendIdAndReceiveId(login_user.getId(), id);
		List<Chat> c = chatService.findBySendIdAndReceiveId(id, login_user.getId());
		
		for(Chat t : c) {
			chatting.add(t);
		}
		
		Chat ccc = new Chat();
		Collections.sort(chatting, ccc);
		
		model.addAttribute("chatting", chatting);
		return "/main/user/message";
	}

	@RequestMapping("/sendchat")
	public String message(HttpServletRequest request, Model model) throws Exception {
		String s = request.getParameter("sendid");
		String r = request.getParameter("receiveid");
		String chat = request.getParameter("message");

		int sendid = Integer.parseInt(s);
		int receiveid = Integer.parseInt(r);

		chatService.save(receiveid, sendid, chat);

		String redirect_url = "redirect:/main/user/message/" + receiveid;
		return redirect_url;
	}
}
