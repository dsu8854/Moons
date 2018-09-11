package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class ErrorController { 
	@RequestMapping(value = "/400") 
	public String error400() { 
		return "error400"; 
	}
	
	@RequestMapping(value = "/404") 
	public String error404() { 
		return "error404"; 
	}
	
	@RequestMapping(value = "/500") 
	public String error500() { 
		return "error500"; 
	}
}
