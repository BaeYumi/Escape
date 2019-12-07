package univdb;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;

public class DBReservation {

	//데이터베이스 연결 변수선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	//등록한 DBCP 데이터소스 찾아 저장하는 생성자
	public DBReservation() {
		try {
			InitialContext ctx = new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//데이터소스를 통해 데이터베이스에 연결, Connection 객체에 저장하는 메소드
	void connect() {
		try {
			con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//연결 해제
	void disconnect() {
		if(pstmt != null){
			try {
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null){
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}	
	
	//예약하기 insert
	public boolean insertreserv(reservationbean reserv) {
		boolean success = false;
		connect();  
		String sql = "insert into reservation values(0,?,?,?,?,?,?,?)";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, reserv.getDate());
				pstmt.setString(2, reserv.getTheme());
				pstmt.setString(3, reserv.getTime());
				pstmt.setString(4, reserv.getNum());
				pstmt.setString(5, reserv.getName());
				pstmt.setString(6, reserv.getPhone());
				pstmt.setString(7, reserv.getNote());
				pstmt.executeUpdate();
				success = true;
			}catch(SQLException e) {
				e.printStackTrace();
				return success;
			}finally {
				disconnect();
			}
		return success;
	}
	
	//예약확인 list
	
	
	//예약된 DB를 조회하는 관리자페이지
	public ArrayList<reservationbean>getreservList(){
		connect();
		ArrayList<reservationbean>list = new ArrayList<reservationbean>();
		
		String sql = "select * from reservation";
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				reservationbean rvb = new reservationbean();
				rvb.setIndex(rs.getInt("idx"));
				rvb.setDate(rs.getString("date"));
				rvb.setTheme(rs.getString("theme"));
				rvb.setTime(rs.getString("time"));
				rvb.setNum(rs.getString("num"));
				rvb.setName(rs.getString("name"));
				rvb.setPhone(rs.getString("phone"));
				rvb.setNote(rs.getString("note"));
				list.add(rvb);
			}rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
	}
	
	//예약리스트 삭제 메소드
	public boolean deleteList(int num) {
		boolean success = false;
		connect();
		String sql ="delete from reservation where idx=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  num);
			pstmt.executeUpdate();
			success = true;
		} 	catch(SQLException e) {
			e.printStackTrace();
			return success;
		}	finally {
			disconnect();
		}
		return success;
	}
	
}
