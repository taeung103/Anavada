package jboard.model.vo;

import java.sql.Date;

public class Comment implements java.io.Serializable {
	private static final long serialVersionUID = 222L;
		public Comment(){}
		
		private int commentNo;
		private String commentId;
		private String commentContent;
		private java.sql.Date commentDate;
		private java.sql.Date commentLastModified;
		private int jboardNo;
		private int commentRef;
		private int commentReplyRef;
		private int commentLevel;
		private int commentReplySeq;
		
		public Comment(int commentNo, String commentId, String commentContent, Date commentDate,
				Date commentLastModified, int jboardNo, int commentRef, int commentReplyRef, int commentLevel,
				int commentReplySeq) {
			super();
			this.commentNo = commentNo;
			this.commentId = commentId;
			this.commentContent = commentContent;
			this.commentDate = commentDate;
			this.commentLastModified = commentLastModified;
			this.jboardNo = jboardNo;
			this.commentRef = commentRef;
			this.commentReplyRef = commentReplyRef;
			this.commentLevel = commentLevel;
			this.commentReplySeq = commentReplySeq;
		}

		public int getCommentNo() {
			return commentNo;
		}

		public void setCommentNo(int commentNo) {
			this.commentNo = commentNo;
		}

		public String getCommentId() {
			return commentId;
		}

		public void setCommentId(String commentId) {
			this.commentId = commentId;
		}

		public String getCommentContent() {
			return commentContent;
		}

		public void setCommentContent(String commentContent) {
			this.commentContent = commentContent;
		}

		public java.sql.Date getCommentDate() {
			return commentDate;
		}

		public void setCommentDate(java.sql.Date commentDate) {
			this.commentDate = commentDate;
		}

		public java.sql.Date getCommentLastModified() {
			return commentLastModified;
		}

		public void setCommentLastModified(java.sql.Date commentLastModified) {
			this.commentLastModified = commentLastModified;
		}

		public int getJboardNo() {
			return jboardNo;
		}

		public void setJboardNo(int jboardNo) {
			this.jboardNo = jboardNo;
		}

		public int getCommentRef() {
			return commentRef;
		}

		public void setCommentRef(int commentRef) {
			this.commentRef = commentRef;
		}

		public int getCommentReplyRef() {
			return commentReplyRef;
		}

		public void setCommentReplyRef(int commentReplyRef) {
			this.commentReplyRef = commentReplyRef;
		}

		public int getCommentLevel() {
			return commentLevel;
		}

		public void setCommentLevel(int commentLevel) {
			this.commentLevel = commentLevel;
		}

		public int getCommentReplySeq() {
			return commentReplySeq;
		}

		public void setCommentReplySeq(int commentReplySeq) {
			this.commentReplySeq = commentReplySeq;
		}

		@Override
		public String toString() {
			return "Comment [commentNo=" + commentNo + ", commentId=" + commentId + ", commentContent=" + commentContent
					+ ", commentDate=" + commentDate + ", commentLastModified=" + commentLastModified + ", jboardNo="
					+ jboardNo + ", commentRef=" + commentRef + ", commentReplyRef=" + commentReplyRef
					+ ", commentLevel=" + commentLevel + ", commentReplySeq=" + commentReplySeq + "]";
		}
		
		
}
