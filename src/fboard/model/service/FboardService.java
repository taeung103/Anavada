package fboard.model.service;

import static common.JDBCTemp.*;
import java.sql.Connection;
import java.util.ArrayList;

import fboard.model.dao.FboardDao;
import fboard.model.vo.Fboard;

public class FboardService {
	//DI
	private FboardDao fdao = new FboardDao();
	
	public FboardService() {
	}

}
