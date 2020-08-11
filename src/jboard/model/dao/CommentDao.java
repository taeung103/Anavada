package jboard.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;
import jboard.model.vo.Comment;
import jboard.model.vo.Jboard;

public class CommentDao {
	public CommentDao () {}

	public int insertComment(Connection conn, Comment comment) {
		int result = 0;
		 PreparedStatement pstmt = null;
		 
		 String query = null;
		 
		 if(comment.getCommentLevel() ==1) { 
			 query = "insert into jboard_comment values ("
						+ "(select max(comment_no) + 1 from jboard_comment),"
						+ "?, ?, sysdate, sysdate, ?, ?, ?, 1 "
						+ "(select max(comment_no) + 1 from jboard_comment))";
		 }
		 if(comment.getCommentLevel() == 2) {
			 query ="insert into jboard_comment values ("
						+ "(select max(comment_no) + 1 from jboard_comment),"
						+ "?, ?, sysdate, sysdate, ?, ?, ?, 2, ? ";
						
		 }
		 try {
			 	pstmt = conn.prepareStatement(query);
			 	pstmt.setString(1, comment.getCommentContent());
			 	pstmt.setString(2, comment.getCommentId());
			 	pstmt.setInt(3, comment.getJboardNo());
			 	pstmt.setInt(4, comment.getCommentRef());
			 	if (comment.getCommentLevel() == 1) {
			 		pstmt.setInt(5, comment.getCommentReplySeq());
			 	}
			 	if(comment.getCommentLevel() == 2) {
			 			pstmt.setInt(5,  comment.getCommentReplyRef());
			 			pstmt.setInt(6,  comment.getCommentReplySeq());
			 	}
			 	result = pstmt.executeUpdate();				 	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		 return result;
	}
	public int getCommentCount(Connection conn , int jboardNo) {
		int commentListCount = 0;
		Statement stmt =null;
		ResultSet rset = null;
		String query = "select count(*) from JBOARD_COMMENT where JBOARD_NO = " + jboardNo;
		
		try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				
				if (rset.next()) {
					commentListCount = rset.getInt(1);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return commentListCount;
}
	

	public int updateReplySeq(Connection conn, Comment reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateReply(Connection conn, Comment reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Comment> CommentList(Connection conn, int jboardNo) {
		ArrayList<Comment> list = new ArrayList <Comment>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM JBOARD_COMMENT WHERE JBOARD_NO = ?";
		try {
			
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, jboardNo);
			
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Comment comment = new Comment();
					
					comment.setCommentNo(rset.getInt("comment_no"));
					comment.setCommentId(rset.getString("comment_id"));
					comment.setCommentContent(rset.getString("comment_content"));
					comment.setCommentDate(rset.getDate("comment_date"));
					comment.setCommentLastModified(rset.getDate("comment_lastmodified"));
					comment.setJboardNo(rset.getInt("jboard_no"));
					comment.setCommentRef(rset.getInt("comment_ref"));
					comment.setCommentReplyRef(rset.getInt("comment_reply_ref"));
					comment.setCommentLevel(rset.getInt("comment_level"));
					comment.setCommentReplySeq(rset.getInt("comment_reply_seq"));
					
					list.add(comment);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	return list; 
}

	public Comment selectComment(Connection conn, int commentNo) {
		// TODO Auto-generated method stub
		return null;
	}


	
}

