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

	public int insertComment(Connection conn, Comment reply) {
		int result = 0;
		 PreparedStatement pstmt = null;
		 
		 String query = null;
		 
		 if(reply.getCommentLevel() ==1) { 
			 query = "insert into jboard_comment values ("
						+ "JBOARD_COMMENT_SEQ.nextval , ?, ?, sysdate, "
						+ "sysdate, ?, ?, JBOARD_COMMENT_SEQ.nextval , 1 "
						+ "?";
		 }
		 if(reply.getCommentLevel() == 2) {
			 query ="insert into jboard_comment values ("
						+ "JBOARD_COMMENT_SEQ.nextval , ?, ? ,sysdate, sysdate, ?"
						+ "?, ?,  ?, ?, ?, 2, ? ";
						
		 }
		 try {
			 	pstmt = conn.prepareStatement(query);
			 	pstmt.setString(1, reply.getCommentId());
			 	pstmt.setString(2, reply.getCommentContent());
			 	pstmt.setInt(3, reply.getJboardNo());
			 	pstmt.setInt(4, reply.getJboardNo());
			 	if (reply.getCommentLevel() == 1) {
			 		pstmt.setInt(5, reply.getCommentReplySeq());
			 	}
			 	if(reply.getCommentLevel() == 2) {
			 			pstmt.setInt(5,  reply.getCommentReplyRef());
			 			pstmt.setInt(6,  reply.getCommentReplySeq());
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
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = null;
		
		if(reply.getCommentLevel() == 1) {
				query = "update jboard_comment set comment_reply_seq = comment_reply_seq + 1 "
						+"where comment_ref = ? and comment_level = ?";
		}
		if(reply.getCommentLevel() ==2) {
			query = "update jboard_comment set comment_reply_seq = comment_reply_seq + 1 "
					+"where comment_ref = ? and comment_level = ? "
					+ "and comment_reply_ref = ?";
		}
		
		try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, reply.getCommentRef());
				pstmt.setInt(2, reply.getCommentLevel());
				if (reply.getCommentLevel() ==2) {
						pstmt.setInt(3, reply.getCommentReplyRef());
				}
				
				result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
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

