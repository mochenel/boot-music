package com.example.demo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Service;

@Service
public class UserService {
	 @Autowired
	 JdbcTemplate jdbcTemplate;
	 
	 
	 public List<User> findAll() {
	
	        String sql = "SELECT * FROM users";

	        return jdbcTemplate.query(
	                sql,
	                (rs, rowNum) ->{
	                   User user = new User();
	                   user.setContact(rs.getString(2));
	                   user.setEmail(rs.getString(3));
	                   user.setFname(rs.getString(4));
	                   user.setLname(rs.getString(5));
	                   user.setGender(rs.getString(6));
	                   user.setPwd(rs.getString(7));
	                	return user;
	                               
	                });
	    }
	 private List<User> findUserByEmailOrContact(String email, String contact) {
		  String sql = "SELECT * FROM users WHERE email = ? OR contact = ?";
	      return jdbcTemplate.query(
	                sql,
	                new Object[] {email,contact},
	                (rs,rowNum)->{
	                    User user = new User();
		                   user.setContact(rs.getString(2));
		                   user.setEmail(rs.getString(3));
		                   user.setFname(rs.getString(4));
		                   user.setLname(rs.getString(5));
		                   user.setGender(rs.getString(6));
		                   user.setPwd(rs.getString(7));
		                	return user;
		                               
	                }
	             );
	 }
	 
	 // Find user by email and pwd, return user credentials into a Login list object
	 private List<Login> findUserByEmailAndPassword(String email, String pwd) {
		  String sql = "SELECT * FROM users WHERE email = ? AND pwd = ?";
	      return jdbcTemplate.query(
	                sql,
	                new Object[] {email,pwd},
	                (rs,rowNum)->{
	                    Login user = new Login();
	                       user.setId(rs.getInt(1));
		                   user.setEmail(rs.getString(2));
		                   user.setPwd(rs.getString(3));
		                   return user;
		                               
	                }
	             );
	 }
	 
	 public boolean logUser(String email, String pwd,HttpServletRequest servletRequest) {
		 
		 List<Login> login = findUserByEmailAndPassword(email,pwd);
		 
		// response.setHeader("Cache-Control","no-cache,no-store,must-revalidate") http 1.1
		// response.setHeader("pragma","no-cache") http 1.0
		// response.setHeader("Expires","0") proxies
		 if(login.size() > 0) {
			 // SESSION MANAGEMENT
				HttpSession session = servletRequest.getSession();
				session.setAttribute("userID", login.get(0).getId());
			 
			 return true;
		 }
		 
		 return false;
	 }
	 public void logOut(HttpServletRequest servletRequest) {
		HttpSession session = servletRequest.getSession();
		session.removeAttribute("userID");
		session.invalidate();
	 }
	 public void clearErrors(HttpServletRequest servletRequest) {
			HttpSession session = servletRequest.getSession();
			session.removeAttribute("errors");
		 }
	 
	   public String insert(User user) { 
		   List<User> userr = findUserByEmailOrContact(user.getEmail(), user.getContact());
		   // check if passed email or contact exists in users table
		   if(userr.size() > 0 ) {
			   if(userr.get(0).getContact().equals(user.getContact())) {
				   return user.getContact() +" is Already taken";
			   }
			   else {
				   return user.getEmail() +" is Already taken";
			   }
		   }
		   // insert data
		     String sql = "INSERT INTO users (contact, email, fname, lname,gender,pwd) " 
	                + "VALUES (?, ?, ?, ?,?,?)"; 
	        jdbcTemplate.update(sql, new Object[] { user.getContact(), 
	                             					user.getEmail(),
	                             					user.getFname(),
	                             					user.getLname(),
	                             					user.getGender(),
	                             					user.getPwd()
	                             					});
	        
	        return "";
	    }
	   
}
