package creply.model.vo;

import java.sql.Date;

public class Creply {
	private int creply_no;
	private int cbaord_no;
	private String member_id;
	private Date creply_date;
	private String creply_content;
	private int parant_reply;
	private int creply_order;
	private int creply_depth;
	
	public Creply() {}

	public Creply(int creply_no, int cbaord_no, String member_id, Date creply_date, String creply_content,
			int parant_reply, int creply_order, int creply_depth) {
		super();
		this.creply_no = creply_no;
		this.cbaord_no = cbaord_no;
		this.member_id = member_id;
		this.creply_date = creply_date;
		this.creply_content = creply_content;
		this.parant_reply = parant_reply;
		this.creply_order = creply_order;
		this.creply_depth = creply_depth;
	}

	public int getCreply_no() {
		return creply_no;
	}

	public void setCreply_no(int creply_no) {
		this.creply_no = creply_no;
	}

	public int getCbaord_no() {
		return cbaord_no;
	}

	public void setCbaord_no(int cbaord_no) {
		this.cbaord_no = cbaord_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getCreply_date() {
		return creply_date;
	}

	public void setCreply_date(Date creply_date) {
		this.creply_date = creply_date;
	}

	public String getCreply_content() {
		return creply_content;
	}

	public void setCreply_content(String creply_content) {
		this.creply_content = creply_content;
	}

	public int getParant_reply() {
		return parant_reply;
	}

	public void setParant_reply(int parant_reply) {
		this.parant_reply = parant_reply;
	}

	public int getCreply_order() {
		return creply_order;
	}

	public void setCreply_order(int creply_order) {
		this.creply_order = creply_order;
	}

	public int getCreply_depth() {
		return creply_depth;
	}

	public void setCreply_depth(int creply_depth) {
		this.creply_depth = creply_depth;
	}

	@Override
	public String toString() {
		return "Creply [creply_no=" + creply_no + ", cbaord_no=" + cbaord_no + ", member_id=" + member_id
				+ ", creply_date=" + creply_date + ", creply_content=" + creply_content + ", parant_reply="
				+ parant_reply + ", creply_order=" + creply_order + ", creply_depth=" + creply_depth + "]";
	}
	
	
}
