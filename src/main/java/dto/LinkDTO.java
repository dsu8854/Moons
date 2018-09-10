package dto;

public class LinkDTO {
	private int link_type;
	private int location;
	private int board_num;
	
	public LinkDTO() {
		
	}

	public int getLink_type() {
		return link_type;
	}

	public void setLink_type(int link_type) {
		this.link_type = link_type;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
}
