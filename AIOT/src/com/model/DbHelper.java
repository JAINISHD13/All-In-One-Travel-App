package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Bean.LoginBean;
import com.Bean.RegistrationBean;
import com.DAO.getConnection;


public class DbHelper 
{
	
	public int insert(RegistrationBean rb)
	{
		getConnection g1=new getConnection();
		int x=0;
		Connection con= g1.getConnection1();
		String sql="insert into Registration values(?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, rb.getUsername());
			ps.setString(2, rb.getPassword());
			 x=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
		
	}
	public boolean validate(LoginBean lb)
	{
		getConnection g1=new getConnection();
		boolean ans=false;
		int cnt=0;
		Connection con=g1.getConnection1();
		String sql="select * from Registration where username=? and password=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, lb.getUsername());
			ps.setString(2, lb.getPassword());
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				cnt++;
			}
			if(cnt>0)
				ans=true;
			else
				ans=false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ans;
	}
}
