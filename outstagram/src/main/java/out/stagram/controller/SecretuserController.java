package out.stagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import out.stagram.domain.User;
import out.stagram.service.UserService;

@Controller
public class SecretuserController {
	@Autowired
	UserService userService;

	@RequestMapping("/secret/view/{id}")
	@ResponseBody
	private boolean secret_view(@PathVariable int id) throws Exception {
		boolean b = userService.IsSecret(id);

		return b;
	}

	@RequestMapping("/secret/insert/{id}")
	@ResponseBody
	private int secret_insert(@PathVariable int id) throws Exception {
		userService.enable_user(id, 2);
		
		return 1;
	}
	
	@RequestMapping("/secret/delete/{id}")
	@ResponseBody
	private int secret_delete(@PathVariable int id) throws Exception {
		userService.enable_user(id, 1);
		
		return 1;
	}
}
