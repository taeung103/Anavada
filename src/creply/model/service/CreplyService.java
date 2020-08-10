package creply.model.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cboard.model.vo.Cboard;
import creply.model.dao.CreplyDao;
import creply.model.vo.Creply;

public class CreplyService {
	private CreplyDao crdao = new CreplyDao();
	
	public CreplyService() {}

	public ArrayList<Creply> creplyList(int cboardNo) {
		Connection conn = getConnection();
		ArrayList<Creply> rlist = crdao.selectList(conn, cboardNo);
		close(conn);
		return rlist;
	}

	public int allReplyCount(int cboardNum) {
		Connection conn = getConnection();
		int replyCount = crdao.getAllReplyListCount(conn, cboardNum);
		close(conn);
		return replyCount;
	}
}
