package out.stagram.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import out.stagram.domain.PoCo;
import out.stagram.domain.PoU;
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

	// post view
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

	// /main page post heart
	@RequestMapping("/heart/view")
	@ResponseBody
	private Map<String, Object> heart_view(@RequestParam String jsonData) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);

		Map<String, Object> m = new HashMap<String, Object>();
		List<Object> lst = list_find(jsonData);

		List<PoCo> pst = new ArrayList<>();
		for (int i = 0; i < lst.size(); i++) {
			int pid = Integer.parseInt(lst.get(i).toString());
			int cnt = heartService.countByPostId(pid);
			PoCo pc = new PoCo();
			pc.setCnt(cnt);
			pc.setPostid(pid);
			pst.add(pc);
		}

		List<PoU> pu = new ArrayList<>();
		for (int i = 0; i < lst.size(); i++) {
			int pid = Integer.parseInt(lst.get(i).toString());
			boolean bb;
			if (heartService.countByPostIdAndUserId(pid, u.getId()) == 1)
				bb = true;
			else
				bb = false;
			
			PoU pou = new PoU();
			pou.setB(bb);
			pou.setPostid(pid);
			pu.add(pou);
		}

		m.put("pst", pst); // postid에 따른 like cnt
		m.put("pu", pu); // user가 post에 like를 눌렀는지 여부 boolean으로

		return m;
	}

	private List<Object> list_find(String jsonData) {
		// 직렬화 시켜 가져온 오브젝트 배열을 JSONArray 형식으로 바꿔준다.
		JSONArray array = JSONArray.fromObject(jsonData);
		List<Map<String, Object>> resendList = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < array.size(); i++) {
			JSONObject obj = (JSONObject) array.get(i);
			Map<String, Object> resendMap = new HashMap<String, Object>();

			resendMap.put("id", obj.get("id"));

			resendList.add(resendMap);
		}

		List<Object> lst = new ArrayList<Object>(); // ㅠ.ㅠ 드디어... id값이 넘어왔다ㅠ.ㅠ

		for (int i = 0; i < resendList.size(); i++) {
			String str = resendList.get(i).toString();
			String restr = str.replaceAll("[^0-9]", "");
			lst.add(restr);
		}
		return lst;
	}

}
