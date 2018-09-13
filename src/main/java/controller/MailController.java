package controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.UserDTO;
import service.AdminService;
import service.UserService;

// http://localhost:8090/myemail/mail/mailForm
// 매핑을 /mail/* 이렇게 했으면 RequestMapping에는 /mail은 빼고 뒤에만 써야됨

@Controller
public class MailController {
	// mailSender 세터 안 만들어도 됨
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private AdminService adminService;
	
	// mailSending 코드
	@RequestMapping(value = "/mailSend.do", produces="application/text;charset=utf8")
	public @ResponseBody String mailSend(UserDTO udto, HttpServletRequest request) {
		String setfrom = "dsu8854@gmail.com";
		String tomail = udto.getUser_email(); // 받는 사람 이메일
		String title = "[Moons] 인증 메일입니다."; // 제목
		String content = "아래의 인증코드를 입력하시면 인증 절차가 진행됩니다.\n\n"; // 내용
		
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		for(int i=0;i<6;i++){
		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer에 append 한다.
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10)));
		    }
		}
		
		content += buf.toString();
		System.out.println(buf.toString());

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e.toString());
			return "발송 실패";
		}

		return buf.toString();
	}
	
	// mailSending 코드
	@RequestMapping(value = "/mailSendAll.do")
	public @ResponseBody boolean mailSendAll(String title, String content) {
		String setfrom = "dsu8854@gmail.com";
		String[] tomail = adminService.selectEmailAllProcess().toArray(new String[adminService.selectEmailAllProcess().size()]); // 받는 사람 이메일
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
}