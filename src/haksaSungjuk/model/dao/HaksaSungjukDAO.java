package haksaSungjuk.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaSungjuk.model.dto.HaksaSungjukDTO;

public class HaksaSungjukDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaSungjukDTO> getSelectAll() {
		ArrayList<HaksaSungjukDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaSungjuk order by sungjukNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaSungjukDTO resultDto = new HaksaSungjukDTO();
				resultDto.setSungjukNo(rs.getInt("sungjukNo"));
				resultDto.setKor(rs.getInt("kor"));
				resultDto.setEng(rs.getInt("eng"));
				resultDto.setMat(rs.getInt("mat"));
				resultDto.setSci(rs.getInt("sci"));
				resultDto.setHis(rs.getInt("his"));
				resultDto.setTot(rs.getInt("tot"));
				resultDto.setAvg(rs.getInt("avg"));
				resultDto.setGrade(rs.getString("grade"));
				resultDto.setHakbun(rs.getInt("hakbun"));
				resultDto.setSihumNo(rs.getInt("sihumNo"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
				list.add(resultDto);
			}
		} catch (Exception e) {
			
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	public HaksaSungjukDTO getSelectOne(HaksaSungjukDTO paramDto) {
		HaksaSungjukDTO resultDto = new HaksaSungjukDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaSungjuk where sungjukNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,paramDto.getSungjukNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setSungjukNo(rs.getInt("sungjukNo"));
				resultDto.setKor(rs.getInt("kor"));
				resultDto.setEng(rs.getInt("eng"));
				resultDto.setMat(rs.getInt("mat"));
				resultDto.setSci(rs.getInt("sci"));
				resultDto.setHis(rs.getInt("his"));
				resultDto.setTot(rs.getInt("tot"));
				resultDto.setAvg(rs.getInt("avg"));
				resultDto.setGrade(rs.getString("grade"));
				resultDto.setHakbun(rs.getInt("hakbun"));
				resultDto.setSihumNo(rs.getInt("sihumNo"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return resultDto;
		
	}
	public int setInsert(HaksaSungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into haksaSungjuk values (seq_haksaSungjuk.nextval,?,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getKor());
			pstmt.setInt(2, paramDto.getEng());
			pstmt.setInt(3, paramDto.getMat());
			pstmt.setInt(4, paramDto.getSci());
			pstmt.setInt(5, paramDto.getHis());
			pstmt.setInt(6, paramDto.getTot());
			pstmt.setInt(7, paramDto.getAvg());
			pstmt.setString(8, paramDto.getGrade());
			pstmt.setInt(9, paramDto.getHakbun());
			pstmt.setInt(10, paramDto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	public int setUpdate(HaksaSungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update haksaSungjuk set kor=?,eng=?,mat=?,sci=?,his=?,tot=?,avg=?,grade=? where sungjukNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getKor());
			pstmt.setInt(2, paramDto.getEng());
			pstmt.setInt(3, paramDto.getMat());
			pstmt.setInt(4, paramDto.getSci());
			pstmt.setInt(5, paramDto.getHis());
			pstmt.setInt(6, paramDto.getTot());
			pstmt.setInt(7, paramDto.getAvg());
			pstmt.setString(8, paramDto.getGrade());
			pstmt.setInt(9, paramDto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	public int setDelete(HaksaSungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete haksaSungjuk where sungjukNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
