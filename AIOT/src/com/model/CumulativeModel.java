package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Bean.CumulativeBean;
import com.DAO.getConnection;


public class CumulativeModel 
{
	public int insert(CumulativeBean cb) throws SQLException
	{
		int x=0;
		getConnection c1=new getConnection();
		Connection con=c1.getConnection1();
		int count=0,tot = 0,flagt=0;
		String sql="select sum(number) as total from cumulative where tdate=? and tname=?";
		String sql1="select * from number";
		Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery(sql1);
		while(rs1.next())
		{
			if(cb.getTname().equals(rs1.getString(1)))
			{
				tot=rs1.getInt(2);
			}
		}
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, cb.getTdate());
		ps.setString(2, cb.getTname());
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			count=rs.getInt("total");
			int y=Integer.parseInt(cb.getNumber());
			if((y+count)<=tot)
				flagt=1;
		}
		if(flagt==1)
		{
			String sql2="insert into cumulative values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps2=con.prepareStatement(sql2);
			ps2.setString(1, cb.getName());
			ps2.setString(2, cb.getEmail());
			ps2.setString(3, cb.getContact());
			ps2.setString(4, cb.getPick());
			ps2.setString(5, cb.getDrop());
			ps2.setString(6, cb.getType());
			ps2.setString(7, cb.getTdate());
			ps2.setString(8, cb.getTname());
			ps2.setString(9, cb.getNumber());
			x=ps2.executeUpdate();
			System.out.println(x+" rows inserted");
		}
		return x;
	}
	
}
