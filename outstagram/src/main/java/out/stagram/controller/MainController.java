package out.stagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import out.stagram.domain.User;
import out.stagram.service.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/main")
	public String main_page(Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		
		model.addAttribute("user", userService.findByUserId(userId));
		return "/main";
	}
}
