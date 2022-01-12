package com.poscoict.emaillist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.poscoict.emaillist.vo.EmaillistVo;

public class EmaillistDao {
	
	public List<EmaillistVo> findAll(){
		Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		List<EmaillistVo> result = new ArrayList<>();
		try {
			// 1. JDBC 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// 2. 연결하기
			String url = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=UTC";
			String user = "webdb";
			String passwd = "webdb";
			conn = DriverManager.getConnection(url, user, passwd);
			
			// 3. SQL 준비
			String sql = "select no, first_name, last_name, email from emaillist order by no desc";
			stmt = conn.createStatement();
			
			// 4. 바인딩(binding)
			
			// 5. SQL 실행
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Long no = rs.getLong(1);
				String firstName = rs.getString(2);
				String lastName = rs.getString(3);
				String email = rs.getString(4);
				
				EmaillistVo vo = new EmaillistVo();
				vo.setNo(no);
				vo.setFirstName(firstName);
				vo.setLastName(lastName);
				vo.setEmail(email);
				result.add(vo);
			}
			
		}
		catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e.getMessage());
		}
		catch (SQLException e) {
			System.out.println("드라이버 로딩 실패 : " + e.getMessage());
		}
		finally {
			// 자원 정리
			try {
				if(rs!=null) {
					rs.close();
				}
				if(stmt!=null) {
					stmt.close();
				}
				if(conn!=null) {
					conn.close();
				}	
			}
			catch(SQLException e) {
				e.printStackTrace();
			}	
		}
		return result;
	
}
}


