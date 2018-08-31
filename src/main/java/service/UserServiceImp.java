package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.UserDAO;
import dto.FollowDTO;
import dto.UserDTO;

public class UserServiceImp implements UserService {
	private UserDAO userDao;
	
	public UserServiceImp() {
		
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public void insertProcess(UserDTO udto) {
		userDao.insertMethod(udto);
	}

	@Override
	public void deleteProcess(UserDTO udto) {
		userDao.deleteMethod(udto);
	}

	@Override
	public boolean checkIdProcess(UserDTO udto) {
		return userDao.checkIdMethod(udto);
	}
	
	@Override
	public boolean checkNickProcess(UserDTO udto) {
		return userDao.checkNickMethod(udto);
	}

	@Override
	public int codeProcess(UserDTO udto) {
		return userDao.codeMethod(udto);
	}

	@Override
	public boolean checkIdPassProcess(UserDTO udto) {
		return userDao.checkIdPassMethod(udto);
	}

	@Override
	public boolean checkEmailProcess(UserDTO udto) {
		return userDao.checkEmailMethod(udto);
	}

	@Override
	public String passProcess(UserDTO udto) {
		return userDao.passMethod(udto);
	}
	
	public void setProfileDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public String selectPhotoProcess(int user_code) {
		return userDao.selectPhotoMethod(user_code);
	}
	
	@Override
	public String selectNickProcess(int user_code) {
		return userDao.selectNickMethod(user_code);
	}
	
	@Override
	public UserDTO selectAllInfoProcess(int user_code) {
		return userDao.selectAllInfoMethod(user_code);
	}
	
	@Override
	public UserDTO selectInfoProcess(int user_code) {
		return userDao.selectInfoMethod(user_code);
	}
	
	@Override
	public UserDTO selectUpdateInfoProcess(int user_code) {
		return userDao.selectUpdateInfoMethod(user_code);
	}
	
	@Override
	public String updateInfoProcess(UserDTO udto) {
		// 기존 첨부파일
		String filename = userDao.selectPhotoMethod(udto.getUser_code());

		// 수정 첨부파일
		MultipartFile file = udto.getFilename();
		// write.jsp의 첨부파일 이름을 생성

	/*	String root = request.getSession().getServletContext().getRealPath("/");*/
		
		//C:\job\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Moons\
/*		String saveDirectory = root + "images" + File.separator;*/
		
		/*System.out.println(saveDirectory);*/
		/*
		if (!file.isEmpty()) { // 수정파일 있을시
			if (filename != null) { // 기존첨부파일이 있을시 지워야한다. 
				File fe = new File(saveDirectory, filename);
				// parent 객체 폴더의 child 라는 파일에 대한 File 객체를 생성한다.
				fe.delete();
			}

			UUID random = UUID.randomUUID(); // 중복파일명을 처리하기 위해 난수값을 생성해서 받아온다.
			String fileName = file.getOriginalFilename();
			udto.setUser_photo(random + "_" + fileName); // dto에 수정한 첨부파일을 업로드에 맞춘다.

			File ff = new File(saveDirectory, random + "_" + fileName);
			// 파일경로에 파일명으로 생성
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}*/
		userDao.updateInfoMethod(udto);		// 업데이트 실행 
		
		return udto.getUser_photo();	// 첨부파일 반환
	}
	
	@Override
	public void updatePassprocess(UserDTO udto) {
		userDao.updatePassMethod(udto);
		
	}

	@Override
	public List<FollowDTO> selectFollowListProcess(UserDTO udto) {
		return userDao.selectFollowListMethod(udto);
	}

	@Override
	public int followCountProcess(UserDTO udto) {
		return userDao.followCountMethod(udto);
	}

	@Override
	public List<FollowDTO> selectFollowerListProcess(UserDTO udto) {
		return userDao.selectFollowerListMethod(udto);
	}

	@Override
	public int followerCountProcess(UserDTO udto) {
		return userDao.followerCountMethod(udto);
	}

	@Override
	public void deleteFollowProcess(FollowDTO fdto) {
		userDao.deleteFollowMethod(fdto);
	}

	@Override
	public void insertFollowProcess(FollowDTO fdto) {
		userDao.insertFollowMethod(fdto);
	}
}