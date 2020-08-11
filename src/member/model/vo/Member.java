package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable {
	public Member() {}
	
	private static final long selectServiceUID = 1L;
	
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String fileOriginal;
	private String fileRename;
	private String memberEmail;
	private String emailAuth;
	private String memberPhone;
	private java.sql.Date joinDate;
	private java.sql.Date lastAccessDate;
	private String newPwd;
	private String newPwdOK;
	private String declareId;
	
	public Member(String memberId, String memberPwd, String memberName, String fileOriginal, String fileRename,
			String memberEmail, String emailAuth, String memberPhone, Date joinDate, Date lastAccessDate, String newPwd,
			String newPwdOK, String declareId) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.fileOriginal = fileOriginal;
		this.fileRename = fileRename;
		this.memberEmail = memberEmail;
		this.emailAuth = emailAuth;
		this.memberPhone = memberPhone;
		this.joinDate = joinDate;
		this.lastAccessDate = lastAccessDate;
		this.newPwd = newPwd;
		this.newPwdOK = newPwdOK;
		this.declareId = declareId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getFileOriginal() {
		return fileOriginal;
	}

	public void setFileOriginal(String fileOriginal) {
		this.fileOriginal = fileOriginal;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getEmailAuth() {
		return emailAuth;
	}

	public void setEmailAuth(String emailAuth) {
		this.emailAuth = emailAuth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public java.sql.Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(java.sql.Date joinDate) {
		this.joinDate = joinDate;
	}

	public java.sql.Date getLastAccessDate() {
		return lastAccessDate;
	}

	public void setLastAccessDate(java.sql.Date lastAccessDate) {
		this.lastAccessDate = lastAccessDate;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getNewPwdOK() {
		return newPwdOK;
	}

	public void setNewPwdOK(String newPwdOK) {
		this.newPwdOK = newPwdOK;
	}

	public String getDeclareId() {
		return declareId;
	}

	public void setDeclareId(String declareId) {
		this.declareId = declareId;
	}

	public static long getSelectserviceuid() {
		return selectServiceUID;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", fileOriginal=" + fileOriginal + ", fileRename=" + fileRename + ", memberEmail=" + memberEmail
				+ ", emailAuth=" + emailAuth + ", memberPhone=" + memberPhone + ", joinDate=" + joinDate
				+ ", lastAccessDate=" + lastAccessDate + ", newPwd=" + newPwd + ", newPwdOK=" + newPwdOK
				+ ", declareId=" + declareId + "]";
	}
	
	
	
	
}
