package controller.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.Book;
import model.dao.ProcessBookDAO;
import model.utils.BookDataGetting;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2000, // 2MB
		maxFileSize = 1024 * 1024 * 2000, // 10MB
		maxRequestSize = 1024 * 1024 * 2000) // 50MB
@WebServlet("/ProcessBookServlet")
public class ProcessBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessBookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// get record admin - book-management: thiet lap ("setting") != null de tranh
		// nullpointer exception
		if (request.getParameter("setting") != null) {
			if (request.getParameter("setting").equals("book-management")) {
				try {
					Integer wantedRecord = Integer.parseInt(request.getParameter("wantedRecord"));
					Integer maxIndexRecordOfPage = Integer.parseInt(request.getParameter("maxIndexRecordOfPage"));

					ArrayList<Book> lob = ProcessBookDAO.getDefaultRecords(wantedRecord, maxIndexRecordOfPage);
					request.setAttribute("BookList", lob);
					request.getRequestDispatcher("/admin-pages/book-management.jsp").forward(request, response);
				} catch (SQLException e) {
					request.setAttribute("notify", "Lấy danh sách thất bại: " + e.toString());
					request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
				}
			}
		}

		// get record admin - statistics-management
		if (request.getParameter("setting") != null) {
			if (request.getParameter("setting").equals("statistics-management")) {
				try {
					Integer wantedRecord = Integer.parseInt(request.getParameter("wantedRecord"));

					ArrayList<Book> lob = ProcessBookDAO.getViewestRecords(wantedRecord);
					request.setAttribute("BookList", lob);
					request.getRequestDispatcher("/admin-pages/statistics-management.jsp").forward(request, response);
				} catch (SQLException e) {
					request.setAttribute("notify", "Lấy danh sách thất bại: " + e.toString());
					request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
				}
			}
		}

		// get record home
		if (request.getParameter("setting") != null) {
			if (request.getParameter("setting").equals("linkBook")) {
				try {
					String bookType = request.getParameter("bookTypelink");
					Integer wantedRecord = Integer.parseInt(request.getParameter("wantedRecord"));
					Integer maxIndexRecordOfPage = Integer.parseInt(request.getParameter("maxIndexRecordOfPage"));

					// thiet lap cac gia tri để phục vụ cho chức năng xem sau va pagination
					getServletContext().setAttribute("bookType", bookType);
					getServletContext().setAttribute("wantedRecord", wantedRecord);
					getServletContext().setAttribute("maxIndexRecordOfPage", maxIndexRecordOfPage);

					ArrayList<Book> lob = ProcessBookDAO.getNewestRecordsByType(bookType, wantedRecord,
							maxIndexRecordOfPage);
					request.setAttribute("BookList", lob);
					request.getRequestDispatcher("/home.jsp").forward(request, response);
				} catch (SQLException e) {
					request.setAttribute("notify", "Lấy danh sách thất bại: " + e.toString());
					request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
				}
			}
		}

		// get book record admin - search: setting ở đây là link thể loại sách đã được
		// gắn ở action của form

		if (request.getParameter("searchBookBtn") != null) {
			try {
				String searchStr = request.getParameter("searchForm");
				ArrayList<Book> lob = ProcessBookDAO.getSearchingRecords(searchStr);
				request.setAttribute("BookList", lob);
				request.getRequestDispatcher("/admin-pages/book-management.jsp").forward(request, response);			
			} catch (Exception e) {
				request.setAttribute("notify", "Tìm thất bại: " + e.toString());
				request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// them san pham
		if (request.getParameter("OK") != null) {
			try {
				/* BookDataGetting lấy dữ liệu image và pdf từ form */
				BookDataGetting bookData = new BookDataGetting(request);

				String name = request.getParameter("name");
				String author = request.getParameter("author");
				String type = request.getParameter("type");
				System.out.println(name+" "+author+" "+type);
				String imgBase64 = bookData.getImgBase64();
				InputStream bookDataInput = bookData.getBookDataInput();

				ProcessBookDAO bookProcess = new ProcessBookDAO();
				if (!bookProcess.checkExistingBook(name)) {
					bookProcess.addBook(name, author, type, imgBase64, bookDataInput);
					request.setAttribute("notify", "Thêm thành công");
					request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
				} else {
					request.setAttribute("notify", "Sách đã tồn tại");
					request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
				}

			} catch (Exception e) {
				request.setAttribute("notify", "Thêm thất bại: " + e.toString());
				request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
			}
		}

		// sua san pham
		if (request.getParameter("editBtn") != null) {
			Integer bookId = Integer.parseInt(request.getParameter("bookId"));
			Book book = ProcessBookDAO.getBookByID(bookId);
			session.setAttribute("book", book);
			request.getRequestDispatcher("/admin-pages/book-management-edit.jsp").forward(request, response);
		}
		if (request.getParameter("editOKBtn") != null) {
			System.out.println("da vao editBtn");
			try {
				/* BookDataGetting lấy dữ liệu image và pdf từ form */
				BookDataGetting bookData = new BookDataGetting(request);
				Integer id = Integer.parseInt(request.getParameter("editId"));
				String name = request.getParameter("editName");
				String author = request.getParameter("editAuthor");
				String type = request.getParameter("editType");
				String imgBase64 = bookData.getImgBase64();
				InputStream bookDataInput = bookData.getBookDataInput();

				ProcessBookDAO bookProcess = new ProcessBookDAO();
				bookProcess.editBook(id, name, author, type, imgBase64, bookDataInput);
				request.setAttribute("notify", "Sửa thành công");
				request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);

			} catch (Exception e) {
				request.setAttribute("notify", "Sửa thất bại: " + e.toString());
				request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
			}
		}
		// ket thuc chuc nang sua san pham

		// xoa san pham
		if (request.getParameter("deleteBtn") != null)

		{
			try {
				Integer bookId = Integer.parseInt(request.getParameter("bookId"));
				ProcessBookDAO.removeProduct(bookId);
				request.setAttribute("notify", "Xóa thành công");
				request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("notify", "Xóa thất bại: " + e.toString());
				request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
			}

		}

		// get record home cho cac chuc nang: xem sau (copy co chinh sua o doGet)
		if (request.getParameter("setting") != null) {
			if (request.getParameter("setting").equals("linkBook")) {
				try {
					String bookType = (String) getServletContext().getAttribute("bookType");
					int wantedRecord = (int) getServletContext().getAttribute("wantedRecord");
					int maxIndexRecordOfPage = (int) getServletContext().getAttribute("maxIndexRecordOfPage");

					ArrayList<Book> lob = ProcessBookDAO.getNewestRecordsByType(bookType, wantedRecord,
							maxIndexRecordOfPage);

					session.setAttribute("BookList", lob);
					response.sendRedirect(request.getContextPath() + "/home.jsp");
					// request.getRequestDispatcher("/home.jsp").forward(request, response);
				} catch (SQLException e) {
					request.setAttribute("notify", "Lấy danh sách thất bại: " + e.toString());
					request.getRequestDispatcher("/admin-pages/active-notify.jsp").forward(request, response);
				}
			}
		}
	}

}
