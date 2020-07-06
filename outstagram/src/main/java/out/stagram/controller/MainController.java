package out.stagram.controller;

import java.io.File;
import java.io.IOException;
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

import out.stagram.domain.Post;
import out.stagram.domain.Post_image;
import out.stagram.domain.User;
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

	@RequestMapping("/main")
	public String main_page(Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);
		model.addAttribute("user", u);
		
		model.addAttribute("posting", postService.findByUserIdOrderByIdDesc(u.getId()));
		model.addAttribute("img", piService.findAll());
		return "/main";
	}

	@RequestMapping("/main/user/{id}")
	public String main_user(@PathVariable("id") int id, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();

		model.addAttribute("user", userService.findByUserId(userId));
		return "/main/user";
	}

	@RequestMapping(value = "/main/user/update/{id}", method = RequestMethod.GET)
	public String update_user(@PathVariable("id") int id, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();

		model.addAttribute("user", userService.findByUserId(userId));
		return "/main/user/update";
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

	private String rnd(String originalName, byte[] fileData, String path) throws Exception {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		File target = new File(path, savedName);
		
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
