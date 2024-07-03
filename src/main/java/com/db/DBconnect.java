package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
private static Connection conn;
public static Connection getConnection()
{
	try {
		if(conn==null)
		{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/?user=root/job_portal","root","Rahul@123456");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return conn;
}
}
