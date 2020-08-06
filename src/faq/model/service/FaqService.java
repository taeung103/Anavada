package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import faq.model.dao.FaqDao;
import faq.model.vo.Faq;

import static common.JDBCTemp.*;

public class FaqService {
	
	private FaqDao fdao = new FaqDao();
	
	public FaqService() {}

	public int getListCount() {
		Connection conn = getConnection();
		int result = fdao.getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Faq> selectAll(int currentPage, int countList) {
		Connection conn = getConnection();
		ArrayList<Faq> list = fdao.selectAll(conn, currentPage, countList);
		close(conn);
		return list;
	}
	
	
}
