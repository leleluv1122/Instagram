package out.stagram.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import out.stagram.domain.Heart;
import out.stagram.domain.Post;
import out.stagram.domain.User;
import out.stagram.service.HeartService;
import out.stagram.service.PostService;
import out.stagram.service.UserService;

@Controller
public class HeartController {
	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	@Autowired
	HeartService heartService;

	@RequestMapping("/heart") // save
	public String heart(HttpServletRequest request, Model model) throws Exception {
		String ui = request.getParameter("userid");
		String pi = request.getParameter("postid");
		int uid = Integer.parseInt(ui);
		int pid = Integer.parseInt(pi);
		
		Post p = postService.findById(pid);
		User u = userService.findById(uid);
		
		heartService.save(p, u);
		
		String redirect_url = "redirect:/main/post/" + pid;
		return redirect_url;
	}
	
	@RequestMapping("/noheart") // delete
	public String noheart(HttpServletRequest request, Model model) throws Exception {
		String ui = request.getParameter("userid");
		String pi = request.getParameter("postid");
		
		int uid = Integer.parseInt(ui);
		int pid = Integer.parseInt(pi);
		
		heartService.deleteByPostIdAndUserId(pid, uid);
		
		String redirect_url = "redirect:/main/post/" + pid;
		return redirect_url;
	}
}
