package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Account;
import model.bean.Book;

public class ProcessAccountDAO {

	public boolean checkExistAccount(int mssv, String username) throws SQLException {

		String sql1 = "select mssv from account where mssv = ?";
		String sql2 = "select username from account where username = ?";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql1);
		preSt.setInt(1, mssv);
		System.out.println(mssv);
		ResultSet rs = preSt.executeQuery();
		// Kiểm tra sự tồn tại mssv
		if (rs.next()) {
			rs.close();
			preSt.close();
			con.close();
			return true;
		}
		preSt = con.prepareStatement(sql2);
		preSt.setString(1, username);
		rs = preSt.executeQuery();
		// Kiểm tra sự tồn tại username nếu mssv không tồn tại
		if (rs.next()) {
			rs.close();
			preSt.close();
			con.close();
			return true;
		}

		rs.close();
		preSt.close();
		con.close();

		return false;
	}

	public boolean checkLogin(String username, String password) throws SQLException {

		String sql = "select username from account where username = ? and password = ?";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setString(1, username);
		preSt.setString(2, password);
		ResultSet rs = preSt.executeQuery();
		if (rs.next()) {
			rs.close();
			preSt.close();
			con.close();
			return true;
		}
		rs.close();
		preSt.close();
		con.close();

		return false;
	}

	public Account getAccount(String username) throws SQLException {

		Account acc;
		String sql = "select * from account where username = ?";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setString(1, username);
		ResultSet rs = preSt.executeQuery();
		if (rs.next()) {
			acc = new Account(rs.getInt("mssv"), rs.getString("firstname"), rs.getString("lastname"),
					rs.getString("username"), rs.getString("password"), rs.getBoolean("admin_role"));
			rs.close();
			preSt.close();
			con.close();
			return acc;
		}
		rs.close();
		preSt.close();
		con.close();

		return null;
	}

	public ArrayList<Account> getAccountList() throws SQLException {
		ArrayList<Account> loa = new ArrayList<Account>();

		String sql = "select * from Account order by firstname";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		ResultSet rs = preSt.executeQuery();

		while (rs.next()) {
			loa.add(new Account(rs.getInt("mssv"), rs.getNString("firstname"), rs.getNString("lastname"),
					rs.getString("username"), rs.getString("password"), rs.getBoolean("admin_role")));
		}
		rs.close();
		preSt.close();
		con.close();

		return loa;

	}

	public ArrayList<Account> getSearchingAccountList(String searchStr) throws SQLException {
		ArrayList<Account> loa = new ArrayList<Account>();

		String sql = "SELECT * FROM Account WHERE firstname LIKE 'N%" + searchStr + "%' OR lastname LIKE 'N%" + searchStr
				+ "%' OR username LIKE 'N%" + searchStr + "%'";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		ResultSet rs = preSt.executeQuery();

		while (rs.next()) {
			loa.add(new Account(rs.getInt("mssv"), rs.getNString("firstname"), rs.getNString("lastname"),
					rs.getString("username"), rs.getString("password"), rs.getBoolean("admin_role")));
		}
		rs.close();
		preSt.close();
		con.close();

		return loa;

	}

	public boolean setAccount(int mssv, String firstname, String lastname, String username, String password) {
		try {
			String sql = "insert into account values(?,?,?,?,?,?)";
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement preSt = con.prepareStatement(sql);
			preSt.setInt(1, mssv);
			preSt.setString(2, firstname);
			preSt.setString(3, lastname);
			preSt.setString(4, username);
			preSt.setString(5, password);
			preSt.setBoolean(6, false);
			int i = preSt.executeUpdate();
			if (i == 1) {
				preSt.close();
				con.close();
				return true;
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
			return false;
		}

		return false;

	}

//	public static void main(String[] args) throws SQLException {
////		System.out.println(new ProcessAccountDAO().checkLogin("linh", "123"));
////		System.out.println(new ProcessAccountDAO().getAccount("admin") == null);
////		System.out.println(new ProcessAccountDAO().getAccount("admin").isAdmin_role());
////		System.out.println(new ProcessAccountDAO().checkExistAccount(16130442, "tranlinh"));
////		System.out.println(new ProcessAccountDAO().getAccountList().size());
////		System.out.println(new ProcessAccountDAO().getSearchingAccountList("yêm").size());
//	}
}
