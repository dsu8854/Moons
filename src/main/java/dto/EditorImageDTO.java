package dto;

import java.util.Date;

public class EditorImageDTO {
	String content_type;
	String file_name;
	String file_path;
	Date reg_date;
	String save_file_name;
	int img_size;
	
public EditorImageDTO() {
	// TODO Auto-generated constructor stub
}

public String getContent_type() {
	return content_type;
}

public void setContent_type(String content_type) {
	this.content_type = content_type;
}

public String getFile_name() {
	return file_name;
}

public void setFile_name(String file_name) {
	this.file_name = file_name;
}

public String getFile_path() {
	return file_path;
}

public void setFile_path(String file_path) {
	this.file_path = file_path;
}

public Date getReg_date() {
	return reg_date;
}

public void setReg_date(Date reg_date) {
	this.reg_date = reg_date;
}

public String getSave_file_name() {
	return save_file_name;
}

public void setSave_file_name(String save_file_name) {
	this.save_file_name = save_file_name;
}

public int getImg_size() {
	return img_size;
}

public void setImg_size(int img_size) {
	this.img_size = img_size;
}


}
