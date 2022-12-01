package haksaMember.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaMember.model.dto.HaksaMemberDTO;

public class HaksaMemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public ArrayList<HaksaMemberDTO> getSelectAll() {
		ArrayList<HaksaMemberDTO> list = new ArrayList<HaksaMemberDTO>();
		conn = DB.dbConn();
		try {
			String sql="select * from haksaMember order by hakbun desc";
			pstmt =  conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaMemberDTO resultDto = new HaksaMemberDTO();
				resultDto.setHakbun(rs.getInt("hakbun"));
				resultDto.setName(rs.getString("name"));
				resultDto.setPhone(rs.getString("phone"));
				resultDto.setParentPhone(rs.getString("parentPhone"));
				resultDto.setAddr1(rs.getString("addr1"));
				resultDto.setAddr2(rs.getString("addr2"));
				resultDto.setAddr3(rs.getString("addr3"));
				resultDto.setAddr4(rs.getString("addr4"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
				list.add(resultDto);
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	public HaksaMemberDTO getSelectOne(HaksaMemberDTO paramDto) {
		HaksaMemberDTO resultDto = new HaksaMemberDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaMember where hakbun=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,paramDto.getHakbun());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setHakbun(rs.getInt("hakbun"));
				resultDto.setName(rs.getString("name"));
				resultDto.setPhone(rs.getString("phone"));
				resultDto.setParentPhone(rs.getString("parentPhone"));
				resultDto.setAddr1(rs.getString("addr1"));
				resultDto.setAddr2(rs.getString("addr2"));
				resultDto.setAddr3(rs.getString("addr3"));
				resultDto.setAddr4(rs.getString("addr4"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return resultDto;
	}
	public int setInsert(HaksaMemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into haksaMember values (seq_haksaMember.nextval,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getPhone());
			pstmt.setString(3, paramDto.getParentPhone());
			pstmt.setString(4, paramDto.getAddr1());
			pstmt.setString(5, paramDto.getAddr2());
			pstmt.setString(6, paramDto.getAddr3());
			pstmt.setString(7, paramDto.getAddr4());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	public int setUpdate(HaksaMemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update haksaMember set name=?,phone=?,parentPhone=?,addr1=?,addr2=?,addr3=?,addr4=? where hakbun=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getPhone());
			pstmt.setString(3, paramDto.getParentPhone());
			pstmt.setString(4, paramDto.getAddr1());
			pstmt.setString(5, paramDto.getAddr2());
			pstmt.setString(6, paramDto.getAddr3());
			pstmt.setString(7, paramDto.getAddr4());
			pstmt.setInt(8, paramDto.getHakbun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	public int setDelete(HaksaMemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete haksaMember where hakbun=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getHakbun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
