package notice.model.service;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import java.util.ArrayList;
import static common.JDBCTemp.*;
import java.sql.Connection;

public class NoticeService {
	private NoticeDao ndao = new NoticeDao();
	
	public NoticeService() {}
	
	public ArrayList<Notice> selectAll() {
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectAll(conn);
		close(conn);
		return list;
	}
}
