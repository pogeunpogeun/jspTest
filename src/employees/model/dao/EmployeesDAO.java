package employees.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DB;
import employees.model.dto.EmployeesDTO;

public class EmployeesDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public EmployeesDTO getSelectOne(EmployeesDTO dto) {
		EmployeesDTO resultDto = new EmployeesDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from employees where first_name='Steven' and last_name='King'";
			pstmt =  conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setEmployee_id(rs.getInt("employee_id"));
				resultDto.setFirst_name(rs.getString("setFirst_name"));
				resultDto.setLast_name(rs.getString("last_name"));
				resultDto.setEmail(rs.getString("employee_id"));
				resultDto.setPhone_number(rs.getString("employee_id"));
				resultDto.setHire_date(rs.getDate("hire_date"));
				resultDto.setJob_id(rs.getString("job_id"));
				resultDto.setSalary(rs.getInt("salary"));
				resultDto.setCommission_pct(rs.getInt("commission_pct"));
				resultDto.setManager_id(rs.getInt("manager_id"));
				resultDto.setDepartment_id(rs.getInt("department_id"));
			}
				
			} catch (Exception e) {
				//e.printStackTrace();
			} finally {
				DB.dbConnClose(rs, pstmt, conn);
			}
			return resultDto;
		}
	}

