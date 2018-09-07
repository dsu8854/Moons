package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import dto.CommentDTO;
import dto.RatingDTO;
import service.CommentService;
import service.RatingService;
import service.UserService;

@Controller
public class MovieController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private RatingService ratingService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/movie.do")
	public String movieForm(Model model, String title, String director) {
		String movie=title+"*"+director;
		System.out.println(movie);
		model.addAttribute("commList",commentService.commentListProcess(movie));
		model.addAttribute("allrate",ratingService.checkAllRateProcess(movie)?ratingService.allRatingProcess(movie):0);
		return "movie";
	}
	   
	//영화정보 ajax
	@RequestMapping(value ="/movieOpen.do" , produces = "application/json;charset=UTF-8")
	public @ResponseBody String movieProcess(String title, String director) throws IOException{
	   StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml.jsp");
	   urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") +"=925DD5CDA8483CD65FACCEA95BAC3724DD6AC1CD394756417C83388C345D4B");
	   urlBuilder.append("&" + URLEncoder.encode("collection","UTF-8") +"=" + URLEncoder.encode("kmdb_new","UTF-8"));
	   urlBuilder.append("&" + URLEncoder.encode("detail","UTF-8") +"=" + URLEncoder.encode("Y","UTF-8"));
	   urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") +"=" + URLEncoder.encode(title,"UTF-8"));
	   urlBuilder.append("&" + URLEncoder.encode("director","UTF-8") +"=" + URLEncoder.encode(director,"UTF-8"));
		   
       URL url = new URL(urlBuilder.toString());
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Content-type", "application/json");
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
      //System.out.println(sb.toString());
	   return sb.toString();
	}
	
	//코멘트 ajax
	@RequestMapping("/moviecommentprocess.do")
	@ResponseBody
	public List<CommentDTO> commentProcess(String comment_write, String movie, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		CommentDTO cdto = new CommentDTO();
		cdto.setUser_code(user_code);
		cdto.setComment_movie(movie);
		cdto.setComment_content(comment_write);
		cdto.setComment_date(new Date());
		cdto.setUser_photo(userService.selectPhotoProcess(user_code));
		cdto.setUser_nickname(userService.selectNickProcess(user_code));
		return commentService.commentInsertProcess(movie, cdto);
	}

	//별점 ajax
	@RequestMapping("/movieratingprocess.do")
	@ResponseBody
	public int ratingProcess(String score, String movie, String stat, HttpSession session) {
		System.out.println("session:"+session.getAttribute("user_code").toString());
		System.out.println(movie+stat);
		int user_code = (int) session.getAttribute("user_code");
		RatingDTO rdto = new RatingDTO();
		rdto.setUser_code(user_code);
		rdto.setRating_movie(movie);
		rdto.setRating_score(Integer.parseInt(score));
		if(stat.equals("ins"))
			ratingService.insertRateProcess(rdto);
		else if(stat.equals("upt"))
			ratingService.UpdateRateProcess(rdto);
		else if(stat.equals("del")) {
			ratingService.deleteRateProcess(rdto);
			return 0;
		}
		return ratingService.checkmyRateProcess(rdto)?ratingService.myRateProcess(rdto):0;
	}
}