package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.mysql.cj.protocol.Resultset;

public class JobsDao {
	Connection con;

	public JobsDao(Connection con) {
		super();
		this.con = con;
	}

	
	//INSERT OPRATION
	public boolean postJobs(Jobs jb) {
		boolean f = false;
		try {
			String sql = "INSERT INTO job_portal.jobs( title, description, catagory, status, location) VALUES (?,?,?,?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, jb.getTitle());
			ps.setString(2, jb.getDescription());
			ps.setString(3, jb.getCatagory());
			ps.setString(4, jb.getStatus());
			ps.setString(5, jb.getLocation());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	//SELECT OPRATION
	public List<Jobs> view_Jobs() {
		List<Jobs> list = new ArrayList<Jobs>();

		try {
			String sql = "SELECT * FROM job_portal.jobs   ORDER BY id DESC;";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Jobs j = null;
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCatagory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + " ");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	
	//SELECT JOB ACCORDING TO CATAGORY AND LOCATION
	public List<Jobs> viewJobsAccording_CAT_AND_LOC(String catagory,String location) {
		List<Jobs> list = new ArrayList<Jobs>();

		try {
			String sql = "SELECT * FROM job_portal.jobs  WHERE  catagory=? AND location=?  ORDER BY id DESC;";
			PreparedStatement ps = con.prepareStatement(sql);
			//ps.setString(1, "Active");
			ps.setString(1, catagory);
			ps.setString(2, location);
			ResultSet rs = ps.executeQuery();
			Jobs j = null;
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCatagory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + " ");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	//SELECT JOB ACCORDING TO CATAGORY OR LOCATION
	public List<Jobs> viewJobsAccording_CAT_OR_LOC(String catagory,String location) {
		List<Jobs> list = new ArrayList<Jobs>();

		try {
			String sql = "SELECT * FROM job_portal.jobs  WHERE  catagory=? OR location=?   ORDER BY id DESC;";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, catagory);
			ps.setString(2, location);
			//ps.setString(3, "Active");
			ResultSet rs = ps.executeQuery();
			Jobs j = null;
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCatagory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + " ");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
//Jobs which are active ,it can be seen by user
	public List<Jobs> view_JobsForUser() {
		List<Jobs> list = new ArrayList<Jobs>();

		try {
			String sql = "SELECT * FROM job_portal.jobs  WHERE status=? ORDER BY id DESC;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			Jobs j = null;
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCatagory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + " ");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	//SELECT BY ID OPRATION
	public Jobs getAllById(int id) {

		Jobs j = new Jobs();
		try {
			String sql = "SELECT * FROM job_portal.jobs WHERE id=?;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCatagory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + " ");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return j;

	}
	
	
	//UPDATE OPRATION
	public boolean updateJobs(Jobs j) {
		boolean result = false;

		String sql = "UPDATE job_portal.jobs SET title=? , description=? , catagory=? , status=? ,location=? WHERE id=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3,j.getCatagory() );
			ps.setString(4, j.getStatus());
			ps.setString(5,j.getLocation() );
			ps.setInt(6, j.getId());
			int o = ps.executeUpdate();
			if (o == 1) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	
	//DELETE OPRATION
	public boolean deleteJobs(Jobs j) {
		boolean result = false;

		String sql = "DELETE FROM job_portal.jobs WHERE id=?;";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, j.getId());
			int o = ps.executeUpdate();
			if (o == 1) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}


}
