package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import com.github.scribejava.core.model.OAuth2AccessToken;

import dto.FollowDTO;
import dto.UserDTO;
import oauth.bo.KakaoLoginBO;
import oauth.bo.NaverLoginBO;
import service.UserService;
import socket.WebSocketHandler;

// http://localhost:8090/moons/intro.do

@Controller
public class UserController {
	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;

	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	
	@Autowired
	private UserService userService;

	private String apiResult = null;
	private OAuth2AccessToken oauthToken;
	private String kakaoToken = null;

	// 인트로 화면
	@RequestMapping(value="/intro.do")
	public String intro() {
		return "intro";
	}
	
	// 메인 화면
	@RequestMapping(value="/index.do")
	public String index() {
		return "index";
	}
	
	// 로그인 타입 선택
	@RequestMapping("/loginPage.do")
	public String process(Model model, HttpSession session) {
		if(session.getAttribute("user_type")!=null)
			return "redirect:/unLink.do";
			
		// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "loginPage";
	}

	@RequestMapping("/loginFormDefault.do")
	public String loginFormDefault() {
		return "loginFormDefault";
	}
	
	@RequestMapping("/findFormDefault.do")
	public String findFormDefault() {
		return "findFormDefault";
	}
	
	@RequestMapping(value="/checkEmail.do", produces="application/text;charset=utf8")
	public @ResponseBody String checkEmail(UserDTO udto) {
		if(userService.checkEmailProcess(udto)) {
			return "인증 성공";
		} else {
			return "아이디/이메일 불일치";
		}
	}
	
	@RequestMapping("/findProDefault.do")
	public String findProDefault(Model model, UserDTO udto) {
		model.addAttribute("user_pass", userService.passProcess(udto));
		return "findSuccess";
	}
	
	@RequestMapping(value="/loginProDefault.do", produces="application/text;charset=utf8")
	public @ResponseBody String loginProDefault(UserDTO udto, HttpSession session) {
		if(userService.checkIdPassProcess(udto)) {
			int user_code = userService.codeProcess(udto);
			session.setAttribute("user_code", user_code);
			session.setAttribute("user_type",udto.getUser_type());
			udto.setUser_code(user_code);
			session.setAttribute("user_nickname", userService.selectNickProcess(user_code));
			if(userService.selectPhotoProcess(user_code)!=null)
				session.setAttribute("user_photo",userService.selectPhotoProcess(user_code));
			return "로그인 성공";
		} else {
			return "아이디/비밀번호 불일치";
		}
	}

	@RequestMapping("/joinFormDefault.do")
	public String joinFormDefault() {
		return "joinFormDefault";
	}
	
	@RequestMapping(value="/joinProDefault.do", produces="application/text;charset=utf8")
	public @ResponseBody String joinProDefault(UserDTO udto) {
		if(userService.checkNickProcess(udto)) {
			return "중복된 닉네임";
		}
		else if(userService.checkIdProcess(udto)) {
			return "중복된 아이디";
		} else {
			userService.insertProcess(udto);
			return "가입 성공";
		}
	}
	
	@RequestMapping("/joinSuccess.do")
	public String joinSuccess() {
		return "joinSuccess";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/intro.do";
	}
	
	@RequestMapping("/unLink.do")
	public String unLink(HttpSession session) throws IOException {
		String user_type = (String) session.getAttribute("user_type");
		
		if(user_type.equals("naver")) {
			HttpURLConnection connUnLink = (HttpURLConnection) naverLoginBO.getUnLinkURL(oauthToken).openConnection();
			connUnLink.setRequestMethod("POST");
			connUnLink.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			if (connUnLink.getResponseCode() >= 200 && connUnLink.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(connUnLink.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(connUnLink.getErrorStream()));
			}

			rd.close();
			connUnLink.disconnect();
		} else if(user_type.equals("kakao")) {
			HttpURLConnection connUnLink = (HttpURLConnection) kakaoLoginBO.getUnLinkUrl().openConnection();
			connUnLink.setRequestMethod("POST");
			connUnLink.setRequestProperty("Authorization", "Bearer " + kakaoToken);

			BufferedReader rd;
			if (connUnLink.getResponseCode() >= 200 && connUnLink.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(connUnLink.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(connUnLink.getErrorStream()));
			}

			rd.close();
			connUnLink.disconnect();
		}
		
		if(session.getAttribute("user_code")!=null) {
			UserDTO udto = new UserDTO();
			udto.setUser_code((int) session.getAttribute("user_code"));
			udto.setUser_type(user_type);
			userService.deleteProcess(udto);
		}
		
		return "redirect:/logout.do";
	}

	// 네이버 로그인 결과 확인 및 프로필 조회
	@RequestMapping(value = "/loginProNaver.do")
	public String callbackNaver(Model model, String code, String state, HttpSession session) {
		// 개인정보 제공 동의 중 취소 눌렀을 때
		if (code == null) {
			return "redirect:/intro.do";
		}
		
		try {
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			// 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);

			JSONParser parser = new JSONParser();
			JSONObject univ = (JSONObject) parser.parse(apiResult);
			JSONObject jsonResponse = (JSONObject) univ.get("response");

			String id = jsonResponse.get("id").toString();
			
			UserDTO udto = new UserDTO();
			udto.setUser_id(id);
			udto.setUser_type("naver");
			
			session.setAttribute("user_type",udto.getUser_type());
			
			if(userService.checkIdProcess(udto)) {
				int user_code = userService.codeProcess(udto);
				session.setAttribute("user_code", user_code);
				udto.setUser_code(user_code);
				session.setAttribute("user_nickname", userService.selectNickProcess(user_code));
				if(userService.selectPhotoProcess(user_code)!=null)
					session.setAttribute("user_photo",userService.selectPhotoProcess(user_code));
				return "redirect:/index.do";
			}

			if (jsonResponse.get("email") == null) {
				return "redirect:/unLink.do";
			}
			
			String user_email = jsonResponse.get("email").toString();
			
			udto.setUser_email(user_email);

			model.addAttribute("udto", udto);

			return "joinFormSns";
		} catch (Exception e) {
			session.setAttribute("user_type","naver");
			return "redirect:/unLink.do";
		}
	}

	// 카카오 로그인
	@RequestMapping(value = "/loginFormKakao.do")
	public String loginKakao() throws MalformedURLException {
		return "redirect:" + kakaoLoginBO.getAuthorizationUrl();
	}

	// 카카오 로그인 결과 확인 및 프로필 조회
	@RequestMapping(value = "/loginProKakao.do")
	public String callbackKakao(Model model, HttpSession session, String code) {
		if (code == null) {
			return "redirect:/intro.do";
		}

		// 토큰 및 사용자정보저장을 위한 객체생성
		String inputT = "";
		String totalT = "";
		String inputU = "";
		String totalU = "";

		try {
			HttpURLConnection urlConn = (HttpURLConnection) kakaoLoginBO.getAccessTokenUrl(code).openConnection();
			urlConn.setRequestMethod("POST");

			BufferedReader reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			while ((inputT = reader.readLine()) != null) {
				totalT += inputT;
			}

			JSONParser parser = new JSONParser();
			JSONObject univ = (JSONObject) parser.parse(totalT);
			kakaoToken = (String) univ.get("access_token");

			// 받아온 토큰값을 이용해서 사용자 정보를 불러오는 과정
			HttpURLConnection connU = (HttpURLConnection) kakaoLoginBO.getAccessProfileUrl().openConnection();
			connU.setRequestProperty("Authorization", "Bearer " + kakaoToken);

			BufferedReader readerU = new BufferedReader(new InputStreamReader(connU.getInputStream()));

			while ((inputU = readerU.readLine()) != null) {
				totalU += inputU;
			}

			parser = new JSONParser();
			univ = (JSONObject) parser.parse(totalU);
			
			String id = univ.get("id").toString();
			
			UserDTO udto = new UserDTO();
			udto.setUser_id(id);
			udto.setUser_type("kakao");
			
			session.setAttribute("user_type",udto.getUser_type());
			
			if(userService.checkIdProcess(udto)) {
				int user_code = userService.codeProcess(udto);
				session.setAttribute("user_code", user_code);
				udto.setUser_code(user_code);
				session.setAttribute("user_nickname", userService.selectNickProcess(user_code));
				if(userService.selectPhotoProcess(user_code)!=null)
					session.setAttribute("user_photo",userService.selectPhotoProcess(user_code));
				return "redirect:/index.do";
			}
			
			if (univ.get("kaccount_email") == null) {
				return "redirect:/unLink.do";
			}
			
			String user_email = univ.get("kaccount_email").toString();
			
			udto.setUser_email(user_email);

			model.addAttribute("udto", udto);
			
			return "joinFormSns";
		} catch (Exception e) {
			session.setAttribute("user_type","kakao");
			return "redirect:/unLink.do";
		}
	}
	
	// SNS 가입/로그인
	@RequestMapping(value = "/joinProSns.do", produces="application/text;charset=utf8")
	public @ResponseBody String joinProSns(UserDTO udto, HttpSession session) {
		if(userService.checkNickProcess(udto))
			return "중복된 닉네임";
		else {
			userService.insertProcess(udto);
			session.setAttribute("user_code",userService.codeProcess(udto));
			session.setAttribute("user_type",udto.getUser_type());
			session.setAttribute("user_nickname",udto.getUser_nickname());
			
			return "가입 성공";
		}
	}
	
	@RequestMapping(value = "/profile.do")
	public String profile(Model model, HttpSession session) {
		int user_code = (Integer) session.getAttribute("user_code");
		
		model.addAttribute("userInfo", userService.selectUpdateInfoProcess(user_code));
		return "profile";
	}

	@RequestMapping(value = "/updateInfoForm.do", method = RequestMethod.POST) // 수정 페이지로 이동시
	public String updateInfoForm(Model model, HttpSession session) {
		int user_code = (Integer) session.getAttribute("user_code");
		
		model.addAttribute("dto", userService.selectAllInfoProcess(user_code)); // id에 해당하는 레코드값을 가져온다.
		return "updateInfoForm";
		// 업데이트시 첨부파일을 생략해서 업데이트 해야된다.
	}

	@RequestMapping(value = "/updateInfoPro.do", method = RequestMethod.POST) // 수정후
	public String updateInfoPro(UserDTO udto, HttpSession session, HttpServletRequest request) { // dto내용
		int user_code = (Integer) session.getAttribute("user_code");
		udto.setUser_code(user_code);
		
		// 수정 후
		userService.updateInfoProcess(udto); // request는 첨부파일을 가져오기 위해 사용
		
		/*
		if(udto.getUser_photo()!=null)
			session.setAttribute("user_photo",userService.updateInfoProcess(udto, request));
		*/
		
		
		
		return "redirect:/profile.do";
	}// end updateProc()
	
	@RequestMapping(value="/exit.do")
	public String exit() {
		return "exit";
	}
	
	@RequestMapping(value="/follow.do")					// 팔로워 페이지 이동
	public String followList(Model model, int user_code) {
		/*int user_code = (Integer) session.getAttribute("user_code");*/
		UserDTO udto = new UserDTO();
		udto.setUser_code(user_code);
		
		model.addAttribute("followList",userService.selectFollowListProcess(udto)); // code에 해당하는 팔로워할 유저들 보여주기 
		model.addAttribute("followCount",userService.followCountProcess(udto));		// 팔로워 인원수 
		
		return "follow";
	}
	
	@RequestMapping(value="/follower.do")						// 팔로잉 페이지로 이동
	public String followerList(Model model, int user_code) {
		/*int user_code = (Integer) session.getAttribute("user_code");*/
		UserDTO udto = new UserDTO();
		udto.setUser_code(user_code);
		
		model.addAttribute("followerList",userService.selectFollowerListProcess(udto));	// 팔로잉된 유저들 보여주기
		model.addAttribute("followerCount",userService.followerCountProcess(udto));		// 팔로워 인원수 
		
		return "follower";
	}
	
	@RequestMapping(value="/followDelete.do",method=RequestMethod.POST)				// 팔로우 취소 
	public @ResponseBody boolean followDelete(FollowDTO fdto,HttpSession session) {
		int user_code = (Integer) session.getAttribute("user_code");
		fdto.setUser_code(user_code);
		
		try {
			userService.deleteFollowProcess(fdto);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	@RequestMapping(value="/followApply.do",method=RequestMethod.POST)				// 팔로우 신청 
	public @ResponseBody boolean followApply(FollowDTO fdto,HttpSession session) {
		int user_code = (Integer) session.getAttribute("user_code");
		fdto.setUser_code(user_code);
		
		try {
			userService.insertFollowProcess(fdto);
			WebSocketMessage<String> sendMsg = new TextMessage("5|"+fdto.getFollow_following());
			WebSocketHandler handler = WebSocketHandler.getInstance();
			if(handler.getUserList().get(String.valueOf(fdto.getFollow_following()))!=null)
				handler.handleMessage(handler.getUserList().get(String.valueOf(fdto.getFollow_following())), sendMsg);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	@RequestMapping(value="/about.do")
	public String about() {
		return "about";
	}
	
	@RequestMapping(value="/privacy.do")
	public String privacy() {
		return "privacy";
	}

	@RequestMapping(value="/uploadPhoto.do",method=RequestMethod.POST)
	public String uploadPhoto(Model model, HttpSession session, HttpServletRequest request, MultipartFile image) {
		int user_code = (Integer) session.getAttribute("user_code");
		
		String root = request.getSession().getServletContext().getRealPath("/");
		
		//C:\job\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Moons\
		String saveDirectory = root + "images" + File.separator;
		
		if (!image.isEmpty()) { // 수정파일 있을시
			UUID random = UUID.randomUUID(); // 중복파일명을 처리하기 위해 난수값을 생성해서 받아온다.
			String fileName = image.getOriginalFilename();

			UserDTO udto = new UserDTO();
			udto.setUser_code(user_code);
			udto.setUser_photo(random + "_" + fileName); // dto에 수정한 첨부파일을 업로드에 맞춘다.
			File ff = new File(saveDirectory, random + "_" + fileName);
		

			// 파일경로에 파일명으로 생성
			try {
				FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(ff));
				userService.updateProfilePhotoProcess(udto);
				return "profile";
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "profile";
	}

	@RequestMapping(value="/ranking.do")
	public String ranking() {
		return "ranking";
	}
	
	@RequestMapping(value="/contact.do")
	public String contact() {
		return "contact";
	}
}// end class