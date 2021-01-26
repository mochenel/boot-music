package com.example.demo;


import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DemoController {

	@Autowired
	UserService userService;
	@Autowired
	MusicService musicService;
	
	@RequestMapping(method = RequestMethod.GET,value = "/")
	public ModelAndView getIndexPage(ModelAndView modelAndView,HttpServletRequest servletRequest) {
		if(servletRequest.getSession().getAttribute("userID") != null) {
			return new ModelAndView("redirect:/home");
		}
		modelAndView.setViewName("test");
		HashMap<String,Object> map = new HashMap<>();
		map.put("Error1", "");
		map.put("Error2", "");
		map.put("contact", new User().getContact());
		map.put("email", new User().getEmail());
		map.put("fname", new User().getFname());
		map.put("lname", new User().getLname());
		modelAndView.addAllObjects(map);
		
		return modelAndView;
		
		
	}
	@RequestMapping(method = RequestMethod.GET,value = "/contact")
	public ModelAndView contactUs(ModelAndView modelAndView) {
		
		modelAndView.setViewName("contact");
		
		return modelAndView;
		
	}
	
	@RequestMapping(method = RequestMethod.GET,value = "/home")
	public ModelAndView getHomePage(ModelAndView modelAndView,HttpServletRequest servletRequest) {
		HashMap<String,Object> map = new HashMap<>();
		DecimalFormat f = new DecimalFormat("#.##");
		try {
			int id = musicService.getSession(servletRequest);
			map.put("folders",musicService.findFoldersByUserId(id) );
			map.put("musicList", musicService.getFilesByUserId(id));
			double space = musicService.getSpaceUsed();
			map.put("spaceUsed",f.format((space/500)*100) + "%");
			double freeSpace = 500 - space;
			map.put("freeSpace",freeSpace);
			
		}
		catch (Exception e) {
			// TODO: handle exception
			map.put("folders",null );
		}
		Iterable<String> errors =  (Iterable<String>) servletRequest.getSession().getAttribute("errors");
		map.put("fileErrors", (Iterable<String>) errors);
		if(errors == null || String.valueOf(errors).equals("[]")) {
			map.put("errorExist", "");
		}
		else {
			map.put("errorExist", "yes");
		}
		
		userService.clearErrors(servletRequest);
		modelAndView.setViewName("home");
		modelAndView.addAllObjects(map);
		return modelAndView;

		
		
	}
	

	@RequestMapping(method = RequestMethod.POST,value = "/signIn")
	public ModelAndView  signIn(ModelAndView modelAndView,@ModelAttribute("login") Login login, HttpServletRequest servletRequest) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("Error2", "");
		
		if(userService.logUser(login.getEmail(),login.getPwd(),servletRequest)){
			try {
				int id = musicService.getSession(servletRequest);
				map.put("folders",musicService.findFoldersByUserId(id) );
				map.put("musicList", musicService.getFilesByUserId(id));
			}
			catch (Exception e) {
				// TODO: handle exception
				map.put("folders",null );
			}
			map.put("Error1", "");
			modelAndView.addAllObjects(map);
			return new ModelAndView("redirect:/home");
		}
		
		// failed to login 
		map.put("Error1", "Incorrect Login Details");
		modelAndView.addAllObjects(map);
		modelAndView.setViewName("test");
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/signUp")
	public ModelAndView  signUp(ModelAndView modelAndView,@ModelAttribute("user") User user) {
		HashMap<String,String> map = new HashMap<>();
		map.put("Error1", "");
		map.put("contact", user.getContact());
		map.put("email", user.getEmail());
		map.put("fname", user.getFname());
		map.put("lname", user.getLname());
		
		
		String Add = userService.insert(user);
		if(!Add.equals("")) {
			// An Error occurred 
			map.put("Error2", Add);
		}
		else {
			map.put("Error2", "");
			map.put("success", "success");
		}
		modelAndView.addAllObjects(map);
		modelAndView.setViewName("test");
		return modelAndView;
		
	}
	
	// upload music
	
	@RequestMapping(method = RequestMethod.POST,value = "/upload")
	public ModelAndView uploadFiles(ModelAndView modelAndView,HttpServletRequest servletRequest,@ModelAttribute("music") Music music ) {
		List<String> errors = musicService.uploadMutiFiles(servletRequest,music );
		servletRequest.getSession().setAttribute("errors", (Iterable<String>) errors);
		return new ModelAndView("redirect:/home");
	}
	
	// Log out
	@RequestMapping(method = RequestMethod.POST,value = "/")
	public ModelAndView logOut(ModelAndView modelAndView,HttpServletRequest servletRequest) {
		
		userService.logOut(servletRequest);
		modelAndView.setViewName("test");
		HashMap<String,Object> map = new HashMap<>();
		map.put("Error1", "");
		map.put("Error2", "");
		map.put("contact", new User().getContact());
		map.put("email", new User().getEmail());
		map.put("fname", new User().getFname());
		map.put("lname", new User().getLname());
		modelAndView.addAllObjects(map);
		return modelAndView;
		
		
	}
	
	// add folder
	@RequestMapping(method = RequestMethod.POST,value = "/add")
	public ModelAndView addFolder(ModelAndView modelAndView,HttpServletRequest servletRequest,@ModelAttribute("folder") Folder folder) {
		HashMap<String,Object> map = new HashMap<>();
		int id = musicService.getSession(servletRequest);
		musicService.saveFolder(folder.getFolder(), servletRequest);
		map.put("folders",musicService.findFoldersByUserId(id));
		map.put("musicList", musicService.getFilesByUserId(id));
		modelAndView.addAllObjects(map);
		return new ModelAndView("redirect:/home");
		
		
	}
	// delete song
		@RequestMapping(method = RequestMethod.POST,value = "/delete")
		public ModelAndView deleteSong(ModelAndView modelAndView,HttpServletRequest servletRequest,@RequestParam("val") int val,@RequestParam("nam") String songName) {
			HashMap<String,Object> map = new HashMap<>();
			int id = musicService.getSession(servletRequest);
			musicService.deleteSong(val, id,songName);
			map.put("folders",musicService.findFoldersByUserId(id));
			map.put("musicList", musicService.getFilesByUserId(id));
			
			modelAndView.addAllObjects(map);
			return new ModelAndView("redirect:/home");
			
			
		}
		
		// users
		@RequestMapping(method = RequestMethod.GET,value = "/people")
		public ModelAndView getPeople(ModelAndView modelAndView,HttpServletRequest servletRequest) {
			HashMap<String,Object> map = new HashMap<>();
			map.put("people", musicService.getAllUsers());
			modelAndView.addAllObjects(map);
			modelAndView.setViewName("people");
			return modelAndView;
			
			
		}
		//single user
		@RequestMapping(method = RequestMethod.POST,value = "/user")
		public ModelAndView getUserProfile(ModelAndView modelAndView,HttpServletRequest servletRequest, @RequestParam("uid") int uid) {
			HashMap<String,Object> map = new HashMap<>();
			map.put("folders",musicService.findFoldersByUserId(uid));
			map.put("musicList", musicService.getFilesByUserId(uid));
			modelAndView.addAllObjects(map);
			modelAndView.setViewName("userProfile");
			return modelAndView;
			
			
		}
		@RequestMapping(method = RequestMethod.POST,value = "/move")
		public ModelAndView updateFileCategory(ModelAndView modelAndView,HttpServletRequest servletRequest,@ModelAttribute("moveFile") MoveFile moveFile) {
			musicService.changeFileCategory(moveFile);
			return new ModelAndView("redirect:/home");
			
			
		}

}
