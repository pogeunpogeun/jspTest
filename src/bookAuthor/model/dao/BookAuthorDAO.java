package bookAuthor.model.dao;


import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookAuthor.model.dto.BookAuthorDTO;
import config.DB;

public class BookAuthorDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String tableName_1 = "bookAuthor";
	public ArrayList<BookAuthorDTO> getSelectAll() {
		ArrayList<BookAuthorDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_1 + " order by authorNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookAuthorDTO resultDto = new BookAuthorDTO();
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setRegiDate(rs.getDate("regiDate"));		
				list.add(resultDto);
			}
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return list;
	}
	public BookAuthorDTO getSelectOne(BookAuthorDTO paramDto) {
		BookAuthorDTO resultDto = new BookAuthorDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_1 + " where authorNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,paramDto.getAuthorNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BookAuthorDTO dto = new BookAuthorDTO();
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}

		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return resultDto;
	}
	public int setInsert(BookAuthorDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into " + tableName_1 + " values (seq_bookAuthor.nextval,?,sysdate)"; //sequence는 중복이 되지 않기 때문에 딱 하나의 레코드를 삽입.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,paramDto.getAuthor());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return result;
	}
	public int setUpdate(BookAuthorDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update " + tableName_1 + " set author=? where authorNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,paramDto.getAuthor());
			pstmt.setInt(2,paramDto.getAuthorNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return result;
		
	}
	public int setDelete(BookAuthorDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from " + tableName_1 + " where authorNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,paramDto.getAuthorNo());
			result = pstmt.executeUpdate();			
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return result;
		
	}

}
