package com.nt.dao;

import com.nt.entity.Info;
import com.nt.entity.User;
import com.nt.entity.UserProfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Repository
public class SHGDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// ---------------- LOGIN ----------------
	public User getUserByUsernameAndPassword(String username, String password) {
		String sql = "SELECT * FROM users WHERE username=? AND password=?";
		List<User> users = jdbcTemplate.query(sql, new Object[] { username, password }, new UserRowMapper());
		return users.isEmpty() ? null : users.get(0);
	}

	// ---------------- GET INFO ----------------
	public List<Info> getInfoByUsername(String username) {
		String sql = "SELECT * FROM info WHERE uname=?";
		return jdbcTemplate.query(sql, new Object[] { username }, new InfoRowMapper());
	}

	public List<Info> getAllInfo() {
		String sql = "SELECT * FROM info";
		return jdbcTemplate.query(sql, new InfoRowMapper());
	}

	// ---------------- UPDATE ----------------
	public int updateInfo(Info info) {
		String sql = "UPDATE info SET name=?, monthly_saving=?, loan_installment=?, fine=?, total=? WHERE id=?";
		return jdbcTemplate.update(sql, info.getName(), info.getMonthly_saving(), info.getLoan_installment(),
				info.getFine(), info.getTotal(), info.getId());
	}

	// ---------------- DELETE ----------------
	public int deleteInfo(int id) {
		String sql = "DELETE FROM info WHERE id=?";
		return jdbcTemplate.update(sql, id);
	}

	// ---------------- REGISTER ----------------
	public int registerUser(User user) {
		String sql = "INSERT INTO users(username, password, role) VALUES (?, ?, ?)";
		return jdbcTemplate.update(sql, user.getUname(), user.getPass(), user.getRole());
	}

	// ---------------- ADD MEMBER ----------------
	public void saveMember(Info info) {
		String sql = "INSERT INTO info(name, monthly_saving, loan_installment, fine, total, uname) VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql, info.getName(), info.getMonthly_saving(), info.getLoan_installment(), info.getFine(),
				info.getTotal(), info.getUname());
	}

	public List<Info> getAllMembers() {
		String sql = "SELECT id, name FROM info";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			Info info = new Info();
			info.setId(rs.getInt("id"));
			info.setName(rs.getString("name"));
			return info;
		});
	}

	public Info getMemberById(int id) {
		String sql = "SELECT * FROM info WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new InfoRowMapper());
	}

	// ---------------- ROW MAPPERS ----------------
	private static class UserRowMapper implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setUname(rs.getString("username"));
			user.setPass(rs.getString("password"));
			user.setRole(rs.getString("role"));
			return user;
		}
	}

	private static class InfoRowMapper implements RowMapper<Info> {
		@Override
		public Info mapRow(ResultSet rs, int rowNum) throws SQLException {
			Info info = new Info();
			info.setId(rs.getInt("id"));
			info.setName(rs.getString("name"));
			info.setMonthly_saving(rs.getString("monthly_saving"));
			info.setLoan_installment(rs.getString("loan_installment"));
			info.setFine(rs.getString("fine"));
			info.setTotal(rs.getString("total"));
			info.setUname(rs.getString("uname"));
			return info;
		}
	}



	public Integer membercount() {
	    String sql = "select count(*) from info";
	    Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
	    if (count == null) {
	        count = 0; 
	    }
	    System.out.println("Total members = " + count);
	    return count;
	}
	public Integer totalsaving() {
	    String sql = "SELECT SUM(monthly_saving) FROM info";
	    Integer total = jdbcTemplate.queryForObject(sql, Integer.class);
	    return (total != null) ? total : 0;  
	}
	
	public int totalFine() {
	    String sql = "SELECT COALESCE(SUM(fine), 0) FROM info";
	    return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int totaltotal() {
	    String sql = "SELECT COALESCE(SUM(total), 0) FROM info";  
	    return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Info> getTopSavers() {
		String sql = "SELECT id, name, monthly_saving FROM info ORDER BY monthly_saving DESC LIMIT 5";

	    return jdbcTemplate.query(sql, new RowMapper<Info>() {
	        @Override
	        public Info mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Info info = new Info();
	            info.setId(rs.getInt("id"));
	            info.setName(rs.getString("name"));
	            info.setMonthly_saving(rs.getDouble("monthly_saving"));
	            return info;
	        }
	    });
	}
	
	
	// STEP 1: insert user + photo path, return generated user id
	public int insertUserAndReturnId(User user) {
	    String sql = "INSERT INTO users(username,password,role,photo_path) VALUES(?,?,?,?)";
	    org.springframework.jdbc.support.GeneratedKeyHolder kh = new org.springframework.jdbc.support.GeneratedKeyHolder();
	    jdbcTemplate.update(con -> {
	        java.sql.PreparedStatement ps = con.prepareStatement(sql, new String[]{"id"});
	        ps.setString(1, user.getUname());
	        ps.setString(2, user.getPass());
	        ps.setString(3, user.getRole());
	        ps.setString(4, user.getPhotoPath());
	        return ps;
	    }, kh);
	    Number key = kh.getKey();
	    return (key == null) ? 0 : key.intValue();
	}

	// ---- LOAN INSERT ----
	public void issueLoan(int memberId, double amount, double rate, int tenure) {
	    String sql = "INSERT INTO loan(member_id, loan_amount, interest_rate, tenure_months, issue_date) VALUES(?,?,?,?,CURDATE())";
	    jdbcTemplate.update(sql, memberId, amount, rate, tenure);
	}

	// ---- ACTIVE LOANS ----
	public List<java.util.Map<String, Object>> getActiveLoans() {
	    String sql = "SELECT l.loan_id, i.name, l.loan_amount, l.interest_rate, l.tenure_months, l.status " +
	                 "FROM loan l JOIN info i ON l.member_id=i.id WHERE l.status='ONGOING'";
	    return jdbcTemplate.queryForList(sql);
	}


	

	


}

