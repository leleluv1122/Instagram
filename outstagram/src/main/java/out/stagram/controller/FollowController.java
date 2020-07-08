package out.stagram.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import out.stagram.service.FollowService;

@Controller
public class FollowController {
	@Autowired
	FollowService followService;

	@RequestMapping("/follow")
	public String follow(HttpServletRequest request, Model model) throws Exception {
		String l = request.getParameter("user_id");
		String p = request.getParameter("page_id");

		int login_id = Integer.parseInt(l);
		int page_id = Integer.parseInt(p);

		followService.save(login_id, page_id);

		String redirect_url = "redirect:/main/user/" + page_id;

		return redirect_url;
	}

	@RequestMapping("/unfollow")
	public String unfollow(HttpServletRequest request, Model model) throws Exception {
		String l = request.getParameter("user_id");
		String p = request.getParameter("page_id");

		int login_id = Integer.parseInt(l);
		int page_id = Integer.parseInt(p);

		followService.deleteByFollowingIdAndFollowerId(page_id, login_id);
		String redirect_url = "redirect:/main/user/" + page_id;

		return redirect_url;
	}
}
