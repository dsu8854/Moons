package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.ProfileDAO;
import dto.UserDTO;

public class ProfileServiceImp implements ProfileService {
	private ProfileDAO profileDao;

	public ProfileServiceImp() {
	}

	public void setProfileDao(ProfileDAO profileDao) {
		this.profileDao = profileDao;
	}
	
	@Override
	public UserDTO contentProcess(UserDTO udto) {
		return profileDao.content(udto);
	}
	
	@Override
	public String updateProcess(UserDTO udto, HttpServletRequest request) {
		// 기존 첨부파일
		String filename = profileDao.getFile(udto);

		// 수정 첨부파일
		MultipartFile file = udto.getFilename();
		// write.jsp의 첨부파일 이름을 생성

		String root = request.getSession().getServletContext().getRealPath("/");
		// String saveDirectory = "c:\\job\\workspace_spring\\Moons\\src\\main\\webapp\\images" + File.separator;
		
		String saveDirectory = root + "images" + File.separator;
		
		
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
		}
		profileDao.update(udto);		// 업데이트 실행 
		
		return udto.getUser_photo();	// 첨부파일 반환
	}

	@Override
	public String getFileProcess(UserDTO udto) {
		return profileDao.getFile(udto);
	}
}