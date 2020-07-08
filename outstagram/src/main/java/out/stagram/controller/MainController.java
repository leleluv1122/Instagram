package out.stagram.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import out.stagram.domain.Follow;
import out.stagram.domain.Post;
import out.stagram.domain.Post_image;
import out.stagram.domain.User;
import out.stagram.service.FollowService;
import out.stagram.service.PostService;
import out.stagram.service.Post_imageService;
import out.stagram.service.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	@Autowired
	Post_imageService piService;
	@Autowired
	FollowService followService;

	@RequestMapping("/main")
	public String main_page(Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);
		
		 // login user가 following한 사람 리스트
		List<Follow> follower_list = followService.findByFollowingId(u.getId());
		
		// login user의 포스팅 select
		List<Post> posting = postService.findByUserIdOrderByIdDesc(u.getId());
		
		// following한 유저의 게시글 select 후 user 포스팅과 list 합치기
		for(Follow f : follower_list) {
			List<Post> post = postService.findByUserIdOrderByIdDesc(f.getFollower().getId());
			for(Post p : post) {
				posting.add(p);
			}
		}
		
		// 포스팅 날짜순으로 거꾸로 정렬하기
		Post p = new Post();
		Collections.sort(posting, p);

		model.addAttribute("user", u);
		model.addAttribute("posting", posting);
		model.addAttribute("img", piService.findAll());
		
		return "/main";
	}

	@RequestMapping("/main/user/{id}")
	public String main_user(@PathVariable("id") int id, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addAttribute("page_id", id);
		model.addAttribute("user", userService.findById(id));
		model.addAttribute("post", postService.findByUserIdOrderByIdDesc(id));
		model.addAttribute("post_image", piService.findByGroupbyPostId());
		model.addAttribute("post_count", postService.countByUserId(id));
		model.addAttribute("follow", followService.find(id, userId));
		
		model.addAttribute("follower", followService.countByFollowerId(id));
		model.addAttribute("following", followService.countByFollowingId(id));

		return "/main/user";
	}

	@RequestMapping(value = "/main/user/update/{id}", method = RequestMethod.GET)
	public String update_user(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("user", userService.findById(id));
		return "/main/user/update";
	}
	
	@RequestMapping("/main/user/follower/{id}")
	public String follower(@PathVariable("id") int id, Model model) throws Exception{
		
		return "/main/user/follower";
	}
	
	@RequestMapping("/main/user/following/{id}")
	public String following(@PathVariable("id") int id, Model model) throws Exception{
		
		return "/main/user/following";
	}

	@RequestMapping(value = "/main/user/image_insert")
	public String image_insert(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile, Model model)
			throws Exception {
		String upload_path = "D:/OutStagram/Instagram/outstagram/src/main/resources/static/images/profile/";
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.findByUserId(userId);
		String redirect_url = "redirect:/main/user/update/" + user.getId();

		try {
			if (user.getProfile_photo() != null) {
				File file = new File(upload_path + user.getProfile_photo());
				file.delete();
			}
			mFile.transferTo(new File(upload_path + mFile.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		userService.img_update(userId, mFile.getOriginalFilename());
		return redirect_url;
	}

	@RequestMapping(value = "/main/user/info_update")
	public String profile_update(HttpServletRequest request, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.findByUserId(userId);
		String redirect_url = "redirect:/main/user/" + user.getId();

		String name = request.getParameter("name");
		String website = request.getParameter("website");
		String introduce = request.getParameter("intro");

		userService.profile_update(userId, name, website, introduce);
		return redirect_url;
	}

	@RequestMapping(value = "/main/upload", method = RequestMethod.GET)
	public String upload(Model model) throws Exception {

		return "/main/upload";
	}

	@RequestMapping("/main/posting")
	public String posting(HttpServletRequest request, MultipartHttpServletRequest mtfRequest, Model model)
			throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		String path = "D:/OutStagram/Instagram/outstagram/src/main/resources/static/images/" + userId;
		File file = new File(path);

		if (!file.exists()) {
			file.mkdirs();
		}

		Post post = new Post();
		String u = request.getParameter("userid");
		int user_id = Integer.parseInt(u);
		User user = userService.findById(user_id);
		String description = request.getParameter("description");
		String location = request.getParameter("location");

		post.setDescription(description);
		post.setLocation(location);
		post.setUser(user);

		post.setId(postService.save(post));
		postService.flush();

		List<MultipartFile> fileList = mtfRequest.getFiles("files");
		for (MultipartFile f : fileList) {
			Post_image pi = new Post_image();

			String original_name = f.getOriginalFilename();
			pi.setFileOriname(original_name);
			String newFile_name = rnd(original_name, f.getBytes(), path);
			pi.setFilename(newFile_name);
			pi.setPostId(post.getId());

			piService.save(pi);
		}

		return "redirect:/main";
	}

	@RequestMapping("/main/recommend")
	public String recommend(Model model) throws Exception {

		return "/main/recommend";
	}

	@RequestMapping(value = "main/search")
	public String search(@RequestParam("word") String word, Model model) throws Exception {
		if (word == "") {
			return "redirect:/main/recommend";
		}
		model.addAttribute("find_user", userService.findByUserIdContains(word));
		model.addAttribute("word", word);

		return "main/search";
	}

	@RequestMapping(value = "main/post/{id}")
	public String post(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("p", postService.findById(id));
		model.addAttribute("img", piService.findBypostId(id));
		
		return "main/post";
	}

	private String rnd(String originalName, byte[] fileData, String path) throws Exception {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		File target = new File(path, savedName);

		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
