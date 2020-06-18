package out.stagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import out.stagram.service.UserService;

@Controller
public class GuestController {
	@Autowired
	UserService userService;
	
	@RequestMapping({ "/", "/guest/login" })
	public String login(Model model) throws Exception {
		return "/guest/login";
	}
}
