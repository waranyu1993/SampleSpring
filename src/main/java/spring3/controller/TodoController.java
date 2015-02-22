package main.java.spring3.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
@RequestMapping(value = "/dotoview")
public class TodoController {
	 public static List<String[]> list = new ArrayList<String[]>();
     @RequestMapping(method = RequestMethod.GET)
     public String viewRegistration(Map<String, Object> model) {
    	User userForm = new User();		
  		model.put("userForm", userForm);
  		model.put("lists", list);
 		return "dotoview";
 	 }
    
 	@RequestMapping(method = RequestMethod.POST)
 	public String processAdd(@ModelAttribute("userForm") User user, 
 			Map<String, Object> model) {
 		
 		String[] myString1= {user.getDescription(),user.getDate()};  
 		list.add(myString1);
 		model.put("lists", list);
 		return "dotoview";
 	} 	
 	
 	@RequestMapping(value = "/delete", method = RequestMethod.POST)
 	public String processDelete(@ModelAttribute("userForm") User user, 
 			Map<String, Object> model) {
 		list.remove(0);
 		model.put("lists", list);
 		return "delete";
 	} 	
}
