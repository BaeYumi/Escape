package univdb;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;

public class DBMember {

	//데이터베이스 연결 변수선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	//등록한 DBCP 데이터소스 찾아 저장하는 생성자
	public DBMember() {
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
	
	//회원가입 insert
	public boolean insertmember(memberbean member) {
		boolean success = false;
		connect();
		String sql = "insert into member values(?,?,?,?,?,?)";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPwd());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getGender());
				pstmt.setString(5, member.getPhone());
				pstmt.setString(6, member.getEmail1()+member.getEmail2());
				pstmt.executeUpdate();
				success= true;
			}catch(SQLException e) {
				e.printStackTrace();
				return success;
			}finally {
				disconnect();
			}
		return success;
	}
	//로그인
	public int Login(String userid, String userpwd) {
		connect();
		int x = 2;
		String sql = "select pwd from member where id =?";
	
		//select문이니까 excuteQuery로!!
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbpwd = rs.getString(1);	//rs를 통해 DB에서 받은 pwd를 dbpwd에 저장
				if(userpwd.equals(dbpwd)) {
					x = 1;	//로그인 성공
				}else {
					x = 0;	//로그인 실패
				}
			}
			else{
				x = -1;		//입력받은 id가없음
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return x;		//2가 그대로 출력되면 실행오류
	}
	
}
