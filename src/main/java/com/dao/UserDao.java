package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
    private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
    
	//add new user to database
	public boolean add_User(User u)
	{
		boolean f= false;
		try {
			String sql="INSERT INTO job_portal.user ( name, email, qualification, password,role) VALUES (?,?,?,?,?);";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getQualification());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getRole());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	//Update the information of user
	public boolean update_User(User u ) {
		boolean f=false;
		
		try {
			String sql="UPDATE  job_portal.user SET name=? ,email=? ,qualification=? ,password=? WHERE id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getQualification());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	//get User By Id
	public User getUserById(int id)
	{
		User u=null;
		try {
			String sql="SELECT * FROM job_portal.user WHERE id=? ";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setQualification(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setRole(rs.getString(6));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return u;
	}
	
	//check login and password right or wrong
	public User login(String email,String password)
	{
		User u=null;
		try {
			String sql="SELECT * FROM job_portal.user WHERE email=? AND password=?; ";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setQualification(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setRole(rs.getString(6));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return u;
	}
}
