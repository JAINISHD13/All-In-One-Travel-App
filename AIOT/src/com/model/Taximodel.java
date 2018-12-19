package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Bean.BusBean;
import com.Bean.TaxiBean;
import com.Bean.TrainBean;
import com.Bean.autoBean;
import com.DAO.getConnection;

public class Taximodel 
{
	public int insert (TaxiBean tb)
	{
		getConnection g1=new getConnection();
		int x=0;
		Connection con= g1.getConnection1();
		String sql="insert into taxibook values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, tb.getName());
			ps.setString(2, tb.getCon());
			ps.setString(3, tb.getEmail());
			ps.setString(4, tb.getDate());
			ps.setString(5, tb.getTime());
			ps.setString(6, tb.getPol());
			ps.setString(7, tb.getDol());
			ps.setString(8, tb.getType());
			x=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}
	public int insertTrain (TrainBean tb){
		getConnection g1=new getConnection();
		int x=0;
		Connection con= g1.getConnection1();
		String sql="insert into trainbook values (?,?,?,?,?)";
		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, tb.getUsername());
			ps.setString(2, tb.getContact());
			ps.setString(3, tb.getEmail());
			ps.setString(4, tb.getType());
			ps.setString(5, tb.getDate());
			x=ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return x;
	}
	public int insertauto (autoBean ab)
	{
		getConnection g1=new getConnection();
		int x=0;
		Connection con= g1.getConnection1();
		System.out.println(ab.getName());
		String sql="insert into autobook values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, ab.getName());
			ps.setString(2, ab.getCon());
			ps.setString(3, ab.getEmail());
			ps.setString(4, ab.getDate());
			ps.setString(5, ab.getTime());
			ps.setString(6, ab.getPol());
			ps.setString(7, ab.getDol());
			x=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}
	public int insertbus (BusBean tb)
	{
		getConnection g1=new getConnection();
		int x=0;
		Connection con= g1.getConnection1();
		String sql="insert into busbook values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, tb.getName());
			ps.setString(2, tb.getCon());
			ps.setString(3, tb.getEmail());
			ps.setString(4, tb.getDate());
			ps.setString(5, tb.getTime());
			ps.setString(6, tb.getPol());
			ps.setString(7, tb.getDol());
			ps.setString(8, tb.getType());
			x=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}
}
