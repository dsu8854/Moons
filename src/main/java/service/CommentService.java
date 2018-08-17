package service;

import java.util.List;

import dto.CommentDTO;

public interface CommentService {
	public List<CommentDTO> commentListProcess(String movie);
	public List<CommentDTO> commentInsertProcess(String movie, CommentDTO dto);
}
