package out.stagram.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/like/view")
	@ResponseBody
	private Map<String, Object> like_view(Model model, int id) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);

		int cnt = heartService.countByPostIdAndUserId(id, u.getId());
		int total_cnt = heartService.countByPostId(id);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cnt", cnt);
		m.put("total_cnt", total_cnt);
		
		return m;
	}

	/*
	 * @RequestMapping("/like/cnt/{id}")
	 * 
	 * @ResponseBody private int like_cnt(@PathVariable int id) throws Exception {
	 * int cnt = heartService.countByPostId(id);
	 * 
	 * return cnt; }
	 */

	@RequestMapping("/like/delete/{id}")
	@ResponseBody
	private int like_delete(@PathVariable int id) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);

		heartService.deleteByPostIdAndUserId(id, u.getId());
		return 1;
	}

	@RequestMapping("/like/insert/{id}")
	@ResponseBody
	private int like_insert(@PathVariable int id) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);
		Post p = postService.findById(id);

		heartService.save(p, u);
		return 1;
	}
}
