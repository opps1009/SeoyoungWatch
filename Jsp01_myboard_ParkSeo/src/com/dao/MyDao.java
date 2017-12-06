package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.MyDto;

public class MyDao {
	Connection con = null;
	
	public MyDao(){
		try {
			System.out.println("1. 드라이버 연결 성공");
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("1. 드라이버 연결 실패");
		}
	}
	
	public List<MyDto> selectAll(){
		con = null;
		Statement stmt= null;
		ResultSet rs = null;
		List<MyDto> res = new ArrayList<MyDto>();
		String sql = "SELECT * FROM MYBOARD ORDER BY MYNO";
		
		try {
			System.out.println("2. 드라이버 연결 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
		} catch (SQLException e1) {
			System.out.println("2. 드라이버 연결 실패");
			e1.printStackTrace();
		}
		
		try {
			System.out.println("3. connection 연결 성공");
			stmt = con.createStatement();
		} catch (SQLException e) {
			System.out.println("3. connection 연결 실패");
			e.printStackTrace();
		}
		
		 try {
			System.out.println("4. query문 준비");
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("4. qeuery문 날릴 준비 실패 ");
			e.printStackTrace();
		}
		
		 try {
			while(rs.next()) {
				 //번호(MYNO), 작성자(MYNAME), 제목(MYTITLE), 내용(MYCONTENT), 날짜(MYDATE) 
				 MyDto tmp = new MyDto();
				 tmp.setMyno(rs.getInt(1));
				 tmp.setMyname(rs.getString(2));
				 tmp.setMytitle(rs.getString(3));
				 tmp.setMycontent(rs.getString(4));
				 tmp.setMadate(rs.getDate(5));
				 
				 res.add(tmp);				 
				 
				 System.out.println("5. query문 날려서 결과 리턴");
			 }
		} catch (SQLException e) {
			System.out.println("5.query문 날려서 결과 리턴 실패 ");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
				System.out.println("6.db 종료 성공");
			} catch (SQLException e) {
				System.out.println("6.db 종료 실패");
				e.printStackTrace();
			}			
		}		
		return res;
	}
	
	public MyDto selectOne(int seq) {
		con=null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MyDto res = new MyDto();
		String sql = "SELECT * FROM MYBOARD WHERE MYNO=? ORDER BY MYNO";		
		
		try {
			System.out.println("2. 드라이버 연결 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
		} catch (SQLException e1) {
			System.out.println("2. 드라이버 연결 실패");
			e1.printStackTrace();
		}
		
		try {
			System.out.println("3. connection 연결 성공");
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
		} catch (SQLException e) {
			System.out.println("3. connection 연결 실패");
			e.printStackTrace();
		}
		
		try {
			System.out.println("4. query문 날릴 준비");
			rs = pstm.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("4. qeuery문 날릴 준비 실패 ");
			e.printStackTrace();
		}
		
		try {
			
			while(rs.next()) {
				res.setMyno(rs.getInt(1));
				res.setMyname(rs.getString(2));
				res.setMytitle(rs.getString(3));
				res.setMycontent(rs.getString(4));
				res.setMadate(rs.getDate(5));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				con.close();
				System.out.println("db 종료 성공");
			} catch (SQLException e) {
				System.out.println("db 종료 실패");
				e.printStackTrace();
			}			
		}
		
		return res;
	}	
	
	
	public int insert(MyDto dto) {
		con=null;
		PreparedStatement pstm = null;
		int res = 0;	
		
		String sql = "INSERT INTO MYBOARD VALUES(MYSEQ.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			System.out.println("2. 드라이버 연결 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
		} catch (SQLException e1) {
			System.out.println("2. 드라이버 연결 실패");
			e1.printStackTrace();
		}
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyname());
			pstm.setString(2, dto.getMytitle());
			pstm.setString(3, dto.getMycontent());
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				con.close();
				System.out.println("db 종료 성공");
			} catch (SQLException e) {
				System.out.println("db 종료 실패");
				e.printStackTrace();
			}			
		}
				
		return res;
	}
	
	public int update(MyDto dto) {
		
		con = null;
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE MYBOARD SET MYTITLE=?,MYCONTENT=? WHERE MYNO=?";
		
		try {
			System.out.println("connection 연결 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
		} catch (SQLException e) {
			System.out.println("connection 연결 실패");
			e.printStackTrace();
		}
		
		try {
			System.out.println("query문 날릴 준비");
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMytitle());
			pstm.setString(2, dto.getMycontent());
			pstm.setInt(3, dto.getMyno());
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("query문 날릴 준비 실패");
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				con.close();
				System.out.println("db 종료 성공");
			} catch (SQLException e) {
				System.out.println("db 종료 실패");
				e.printStackTrace();
			}			
		}		
		
		return res;
	}
	
	public int delete(int seq) {
		con = null;
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM MYBOARD WHERE MYNO=?";
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
			System.out.println("con 연결 성공");
		} catch (SQLException e) {
			System.out.println("con 연결 실패");
			e.printStackTrace();
		}
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, seq);	
			
			res=pstm.executeUpdate();
			System.out.println("query문 연결 성공");
		} catch (SQLException e) {
			System.out.println("query문 연결 실패");
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				con.close();
				System.out.println("db 종료 성공");
			} catch (SQLException e) {
				System.out.println("db 종료 실패");
				e.printStackTrace();
			}			
		}		
		return res;
	}
}
