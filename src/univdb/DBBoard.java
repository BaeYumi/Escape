package univdb;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class DBBoard {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public DBBoard() {
		try {
			InitialContext ctx = new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void connect() {
		try {
			con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
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
	
	
	//게시판 모든레코드 반환 메소드 
	public ArrayList<boardbean> getBoardList() {
		connect();
		ArrayList<boardbean>list = new ArrayList<boardbean>();
		
		String sql = "select * from board";
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				boardbean brd = new boardbean();
				brd.setNum (rs.getInt("num"));
				brd.setId(rs.getString("id"));
				brd.setTitle(rs.getString("title"));
				brd.setRegdate(rs.getTimestamp("regdate"));
				brd.setContent(rs.getString("content"));
				list.add(brd);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	//num의 레코드를 반환하는 메소드
	public boardbean getBoard(int num) {
		connect();
		String sql = "select * from board where num=?";
		boardbean brb = new boardbean();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			brb.setNum(rs.getInt("num"));
			brb.setId(rs.getString("id"));
			brb.setTitle(rs.getString("title"));
			brb.setRegdate(rs.getTimestamp("regdate"));
			brb.setContent(rs.getString("content"));
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return brb;
	}
	
	//게시물 등록 메소드
	public boolean insertDB(boardbean board) {
		boolean success = false;
		connect();
		String sql = "insert into board values(0, ?, ?, sysdate(), ?)";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getTitle());
				pstmt.setString(3, board.getContent());
				pstmt.executeUpdate();
				success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			} finally {
				disconnect();
			}
		return success;
	}
	
	//게시물 수정 메소드
	public boolean updateDB(boardbean board) {
		boolean success = false;
		connect();
		String sql = "update board set id=?, title=?, content=? where num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNum());
			int rowUdt = pstmt.executeUpdate();
			//System.out.println(rowUdt);
			if (rowUdt == 1) success = true;
		}	catch(SQLException e) {
			e.printStackTrace();
			return success;
		}	finally {
			disconnect();
		}
		return success;
	}
	
	//게시물 삭제 메소드
	public boolean deleteDB(int num) {
		boolean success = false;
		connect();
		String sql ="delete from board where num=?";
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
