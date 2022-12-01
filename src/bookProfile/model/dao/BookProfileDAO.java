package bookProfile.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookAuthor.model.dto.BookAuthorDTO;
import bookProfile.model.dto.BookProfileDTO;
import config.DB;

public class BookProfileDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String tableName_2 = "bookProfile";
	public ArrayList<BookProfileDTO> getSelectAll() {
		ArrayList<BookProfileDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_2 + " order by profileNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookProfileDTO resultDto = new BookProfileDTO();
				resultDto.setProfileNo(rs.getInt("profileNo"));
				resultDto.setProfile(rs.getString("profile"));
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
	public BookProfileDTO getSelectOne(BookProfileDTO paramDto) {
		BookProfileDTO resultDto = new BookProfileDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_2 + " where profileNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,paramDto.getProfileNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BookAuthorDTO dto = new BookAuthorDTO();
				resultDto.setProfileNo(rs.getInt("profileNo"));
				resultDto.setProfile(rs.getString("profile"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}

		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return resultDto;
	}

	public int setInsert(BookProfileDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into " + tableName_2 + " values (seq_bookAuthor.nextval,?,sysdate)"; //sequence는 중복이 되지 않기 때문에 딱 하나의 레코드를 삽입.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,paramDto.getProfile());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return result;
	}

	public int setUpdate(BookProfileDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update " + tableName_2 + " set profile=? where profileNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,paramDto.getProfile());
			pstmt.setInt(2,paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return result;
	}

	public int setDelete(BookProfileDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from " + tableName_2 + " where profileNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,paramDto.getProfileNo());
			result = pstmt.executeUpdate();			
		} catch (Exception e) {
			//e.printStackTace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}		
		return result;
		
	}

}
