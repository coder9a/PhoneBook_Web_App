package com.conn;

import java.sql.*;

public class DBConnect 
{
	private static Connection conn;
	public static Connection getConnection()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phnbook","root","root");
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}

}
