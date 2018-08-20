package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jdk.nashorn.internal.parser.JSONParser;


@Controller
public class SearchController {
	
	public SearchController() {

	}
	
	@RequestMapping("/search.do")
	public String searchForm() {
		//return "main/searchForm";
		return "search";
	} 
	
   @RequestMapping(value = "/searchOpen.do", produces = "application/json;charset=UTF-8")
   public @ResponseBody String process(String search, String listCount, String startCount, String detail) throws IOException {
	   StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml.jsp");
	   urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") +"=925DD5CDA8483CD65FACCEA95BAC3724DD6AC1CD394756417C83388C345D4B");
	   urlBuilder.append("&" + URLEncoder.encode("collection","UTF-8") +"=" + URLEncoder.encode("kmdb_new","UTF-8"));
	   urlBuilder.append("&" + URLEncoder.encode("detail","UTF-8") +"=" + URLEncoder.encode(detail,"UTF-8"));  
	   urlBuilder.append("&" + URLEncoder.encode("listCount","UTF-8") +"=" + URLEncoder.encode(listCount,"UTF-8"));  
	   urlBuilder.append("&" + URLEncoder.encode("startCount","UTF-8") +"=" + URLEncoder.encode(startCount,"UTF-8")); 
	   urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") +"=" + URLEncoder.encode(search,"UTF-8"));
		   
       URL url = new URL(urlBuilder.toString());
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Content-type", "application/json");
       System.out.println("Response code: " + conn.getResponseCode());
       BufferedReader rd;
       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
       } else {
           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
       }
       StringBuilder sb = new StringBuilder();
       String line;
       while ((line = rd.readLine()) != null) {
           sb.append(line);
       }
       rd.close();
       conn.disconnect();
       System.out.println(sb.toString());
	   
	   return sb.toString();
   }
}