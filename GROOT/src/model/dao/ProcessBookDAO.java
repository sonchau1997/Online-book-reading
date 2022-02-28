package model.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Book;

public class ProcessBookDAO {

	public boolean checkExistingBook(String bookName) {
		try {
			String sql = "select [BOOK-NAME] from Book where [BOOK-NAME] = ?";
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement preSt = con.prepareStatement(sql);
			preSt.setString(1, bookName);
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

		} catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return false;
	}

	public boolean addBook(String name, String author, String type, String imgBase64, InputStream bookDataInput)
			throws SQLException {

		String sql = "insert into book values(?,?,?,?,?,?)";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setNString(1, name);
		preSt.setNString(2, author);
		preSt.setString(3, type);
		preSt.setString(4, imgBase64);
		preSt.setBlob(5, bookDataInput);
		preSt.setInt(6, 0); // set view=0
		int i = preSt.executeUpdate();
		if (i == 1) {
			preSt.close();
			con.close();
			return true;
		}
		preSt.close();
		con.close();

		return false;
	}

	public boolean editBook(int id, String name, String author, String type, String imgBase64,
			InputStream bookDataInput) throws SQLException {

		String sql = "update book set [BOOK-NAME] = ?, [BOOK-AUTHOR] = ?, [BOOK-type]=? where [BOOK-ID]=?";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		preSt.setNString(1, name);
		preSt.setNString(2, author);
		preSt.setString(3, type);
		preSt.setInt(4, id);
		int i = preSt.executeUpdate();
		if (i == 1) {
			// thay Ä‘á»•i hÃ¬nh áº£nh
			if (imgBase64 != null) {
				sql = "update book set [BOOK-IMAGE] = ? where [BOOK-ID]= ?";
				preSt = con.prepareStatement(sql);
				preSt.setString(1, imgBase64);
				preSt.setInt(2, id);
				preSt.executeUpdate();
			}
			// thay Ä‘á»•i file pdf
			if (bookDataInput != null) {
				sql = "update book set [BOOK-DATA] = ? where [BOOK-ID]= ?";
				preSt = con.prepareStatement(sql);
				preSt.setBlob(1, bookDataInput);
				preSt.setInt(2, id);
				preSt.executeUpdate();
			}
			preSt.close();
			con.close();
			return true;
		}
		preSt.close();
		con.close();

		return false;
	}

	public static boolean removeProduct(int id) {
		Connection con = DatabaseConnection.getConnection();
		String sql = "delete from book where [BOOK-ID]=" + id;
		int i;
		try {
			Statement st = con.createStatement();
			i = st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			return false;
		}
		if (i > 0)
			return true;
		return false;
	}

	public static Book getBookByID(int id) {
		Book book = null;
		Connection con = DatabaseConnection.getConnection();
		String sql = "select [BOOK-NAME],[BOOK-AUTHOR],[BOOK-TYPE] from book where [BOOK-ID]=" + id;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				book = new Book(id, rs.getString("BOOK-NAME"), rs.getString("BOOK-AUTHOR"), rs.getString("BOOK-TYPE"));
				rs.close();
				st.close();
				con.close();
			}

			return book;

		} catch (Exception e) {
			return null;
		}

	}

	public static ArrayList<Book> getDefaultRecords(int wantedRecord, int maxIndexRecordOfPage) throws SQLException {
		ArrayList<Book> lob = new ArrayList<Book>();

		/*
		 * wantedRecord: lÃ  record mÃ  ta mong muá»‘n láº¥y. maxIndexRecordOfPage: vd page 2
		 * cá»§a trang web cÃ³ 10 record tá»« 11 Ä‘áº¿n 20 thÃ¬ maxIndexRecordOfPage lÃ  20. CÃ³ 3
		 * bÆ°á»›c: b1 khoanh vÃ¹ng sá»‘ lÆ°á»£ng record theo maxIndexRecordOfPage vÃ  chá»�n ID cá»§a
		 * nÃ³. b2 chá»�n ID cá»§a sá»‘ record theo wantedRecord (tuy nhiÃªn thá»© tá»± chá»‰ sá»‘ tá»«
		 * cao xuá»‘ng tháº¥p). b3 sáº¯p xáº¿p láº¡i thá»© tá»± chá»‰ sá»‘ tá»« tháº¥p lÃªn cao vÃ  chá»�n danh
		 * má»¥c record.
		 */
		String sql = "select top " + wantedRecord + " * from book where [BOOK-ID] in (select top " + wantedRecord
				+ " [BOOK-ID] from book where [BOOK-ID] in (select top " + maxIndexRecordOfPage
				+ " [BOOK-ID] from Book order by [BOOK-ID]) order by [BOOK-ID] desc ) order by [BOOK-ID] ";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		ResultSet rs = preSt.executeQuery();

		while (rs.next()) {
			lob.add(new Book(rs.getInt("BOOK-ID"), rs.getNString("BOOK-NAME"), rs.getNString("BOOK-AUTHOR"),
					rs.getNString("BOOK-TYPE"), rs.getString("BOOK-IMAGE"), rs.getInt("BOOK-VIEWS")));
		}
		rs.close();
		preSt.close();
		con.close();

		return lob;
	}

	public static ArrayList<Book> getNewestRecordsByType(String bookType, int wantedRecord, int maxIndexRecordOfPage)
			throws SQLException {
		ArrayList<Book> lob = new ArrayList<Book>();

		String sql = "select top " + wantedRecord + " * from book where [BOOK-ID] in (select top " + wantedRecord
				+ " [BOOK-ID] from book where [BOOK-ID] in (select top " + maxIndexRecordOfPage
				+ " [BOOK-ID] from Book where [BOOK-TYPE] = N'" + bookType
				+ "' order by [BOOK-ID] desc) order by [BOOK-ID] ) order by [BOOK-ID] desc";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		ResultSet rs = preSt.executeQuery();

		while (rs.next()) {
			lob.add(new Book(rs.getInt("BOOK-ID"), rs.getNString("BOOK-NAME"), rs.getNString("BOOK-AUTHOR"),
					rs.getNString("BOOK-TYPE"), rs.getString("BOOK-IMAGE"), rs.getInt("BOOK-VIEWS")));
		}
		rs.close();
		preSt.close();
		con.close();

		return lob;
	}

	public static ArrayList<Book> getViewestRecords(int wantedRecord) throws SQLException {
		ArrayList<Book> lob = new ArrayList<Book>();

		String sql = "select top " + wantedRecord + " * from book order by [BOOK-VIEWS] desc";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		ResultSet rs = preSt.executeQuery();

		while (rs.next()) {
			lob.add(new Book(rs.getInt("BOOK-ID"), rs.getNString("BOOK-NAME"), rs.getNString("BOOK-AUTHOR"),
					rs.getNString("BOOK-TYPE"), rs.getString("BOOK-IMAGE"), rs.getInt("BOOK-VIEWS")));
		}
		rs.close();
		preSt.close();
		con.close();

		return lob;
	}

	public static ArrayList<Book> getSearchingRecords(String searchStr) throws SQLException {
		ArrayList<Book> lob = new ArrayList<Book>();

		String sql = "SELECT [BOOK-ID],[BOOK-NAME],[BOOK-AUTHOR],[BOOK-TYPE],[BOOK-IMAGE] FROM Book WHERE [BOOK-ID] LIKE N'%"
				+ searchStr + "%' OR [BOOK-NAME] LIKE N'%" + searchStr + "%' OR [BOOK-AUTHOR] LIKE N'%" + searchStr
				+ "%' OR [BOOK-TYPE] LIKE N'%" + searchStr + "%'";
		Connection con = DatabaseConnection.getConnection();
		PreparedStatement preSt = con.prepareStatement(sql);
		ResultSet rs = preSt.executeQuery();

		while (rs.next()) {
			lob.add(new Book(rs.getInt("BOOK-ID"), rs.getNString("BOOK-NAME"), rs.getNString("BOOK-AUTHOR"),
					rs.getNString("BOOK-TYPE"), rs.getString("BOOK-IMAGE"), 0));
		}
		rs.close();
		preSt.close();
		con.close();

		return lob;

	}

	public static void main(String[] args) throws SQLException {
//		System.out.println(getSearchingRecords("ng").size());
		System.out.println(getNewestRecordsByType("TâmLý KỹNăngSống", 6, 6));
	}

}
