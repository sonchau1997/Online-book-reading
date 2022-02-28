package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Book;

public class ProcessUserBookstoreDAO {

	public static ArrayList<Book> getUserBookstore(int mssv) throws SQLException {
		ArrayList<Book> ubst = new ArrayList<Book>();
		String sql = "select  b.[BOOK-ID], b.[BOOK-NAME], b.[BOOK-AUTHOR] ,b.[BOOK-TYPE], b.[BOOK-IMAGE] from Account a join UserBookStore bst on a.mssv = bst.mssv \r\n"
				+ "						join book b on b.[BOOK-ID] = bst.[BOOK-ID] where a.mssv = ?";

		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setInt(1, mssv);
		ResultSet rs = preSt.executeQuery();
		while (rs.next()) {
			// set book view la 0 vi khong su dung trong gio sach
			ubst.add(new Book(rs.getInt("BOOK-ID"), rs.getString("BOOK-NAME"), rs.getString("BOOK-AUTHOR"),
					rs.getString("BOOK-TYPE"), rs.getString("BOOK-IMAGE"), 0));
		}
		rs.close();
		preSt.close();
		con.close();

		return ubst;

	}

	public static int countBookstoreSize(int mssv) throws SQLException {
		int bookstoreSize;

		String sql = "select count([BOOK-ID]) as SIZE from UserBookStore where  mssv = ?";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setInt(1, mssv);
		ResultSet rs = preSt.executeQuery();
		if (rs.next()) {
			bookstoreSize = rs.getInt("SIZE");
			rs.close();
			preSt.close();
			con.close();
			return bookstoreSize;
		}
		rs.close();
		preSt.close();
		con.close();
		return 0;
	}

	public static boolean setUserBookstore(int mssv, int bookId) throws SQLException {

		String sql = "insert into UserBookStore values (?,?);";

		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setInt(1, mssv);
		preSt.setInt(2, bookId);

		int i = preSt.executeUpdate();
		if (i > 0) {
			preSt.close();
			con.close();
			return true;
		}

		preSt.close();
		con.close();
		return false;
	}

	public static boolean removeBookInStore(int mssv, int bookId) throws SQLException {
		String sql = "delete from UserBookStore where mssv = ? and [BOOK-ID]=?;";

		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setInt(1, mssv);
		preSt.setInt(2, bookId);

		int i = preSt.executeUpdate();
		if (i > 0) {
			preSt.close();
			con.close();
			return true;
		}

		preSt.close();
		con.close();
		return false;
	}

//	public static void main(String[] args) throws SQLException {
//		System.out.println(getUserBookstore(16130443).size());
//		//System.out.println(setUserBookstore(16130443, 47));
//		//System.out.println(removeBookInStore(16130443, 47));
//		//System.out.println(countBookstoreSize(16130443));
//	}
}
