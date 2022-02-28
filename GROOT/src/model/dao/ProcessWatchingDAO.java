package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProcessWatchingDAO {

	public static byte[] getBookData(String bookId) throws SQLException {

		byte[] bookData;
		String sql = "Select [BOOK-DATA] from Book where [BOOK-ID]=?";

		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setString(1, bookId.trim());
		ResultSet rs = preSt.executeQuery();
		if (rs.next()) {
			// nhớ bỏ dấu "[]"
			bookData = rs.getBytes("BOOK-DATA");
			rs.close();
			preSt.close();
			con.close();
			return bookData;
		}
		rs.close();
		preSt.close();
		con.close();

		return null;
	}

	public static void setBookViews(int bookId) throws SQLException {
		int bookViews;
		String getViewsSql = "Select [BOOK-VIEWS] from Book where [BOOK-ID]=?";

		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(getViewsSql);
		preSt.setInt(1, bookId);
		ResultSet rs = preSt.executeQuery();
		if (rs.next()) {
			// nhớ bỏ dấu "[]"
			bookViews = rs.getInt("BOOK-VIEWS");
			bookViews++;
			String setViewsSql = "Update Book set [BOOK-VIEWS] = " + bookViews + "where [BOOK-ID]=?";
			preSt = con.prepareStatement(setViewsSql);
			preSt.setInt(1, bookId);
			int i = preSt.executeUpdate();
			rs.close();
			preSt.close();
			con.close();

		}

	}

}
