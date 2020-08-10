package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import faq.model.dao.FaqDao;
import faq.model.vo.Faq;

import static common.JDBCTemp.*;

public class FaqService {
	
	private FaqDao fdao = new FaqDao();
	
	public FaqService() {}

	public ArrayList<Faq> selectAll() {
		Connection conn = getConnection();
		ArrayList<Faq> list = fdao.selectAll(conn);
		close(conn);
		return list;
	}

	public ArrayList<Faq> selectCategory(int no) {
		Connection conn = getConnection();
		ArrayList<Faq> list = fdao.selectCategory(conn, no);
		close(conn);
		return list;
	}

	
	
	
}
